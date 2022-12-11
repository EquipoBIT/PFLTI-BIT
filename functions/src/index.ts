// import {Timestamp} from "firebase-admin/firestore";
import {Timestamp} from "firebase-admin/firestore";
import * as functions from "firebase-functions";
const compute = require("@google-cloud/compute");
const admin = require("firebase-admin");
let saldo = 0;
let edtEncendida = false;
let usoMinutos2 = 0;
admin.initializeApp();

// Start writing Firebase Functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

exports.startEDT = functions.https.onCall(async (data, context) => {
  const instanceName: string = data.instanceName;
  const edtProjectId: string = data.edtProjectId;
  const edtZone: string = data.edtZone;
  console.log("instanceName = ", instanceName);
  console.log("edtProjectId = ", edtProjectId);
  console.log("edtZone = ", edtZone);
  // obtengo saldo del edt
  const snapshot = await admin.firestore().collection("edts")
      .where("edtNombre", "==", instanceName.toUpperCase())
      .get();
  snapshot.forEach((doc) => {
    console.log(doc.id, "=>", doc.data());
    saldo = doc.data().edtSaldoTiempo;
    edtEncendida = doc.data().edtActivo;
  });
  console.log("Saldo disponible = ", saldo);
  // aqui se podria agregar una constante
  // que defina cual es el saldo minimo
  // para autorizar un encendido
  if ((saldo > 0) && !(edtEncendida)) {
    functions.logger.info(
        `Saldo suficiente ${instanceName} ${saldo}`
    );
    // enciendo EDT en GCloud
    startEDT(instanceName, edtProjectId, edtZone);
    // marco campo en uso y agrego entrada en coleccion enuso
    admin.firestore().collection("edts")
        .where("edtNombre", "==", instanceName.toUpperCase())
        .get()
        .then(function(querySnapshot) {
          querySnapshot.forEach(function(doc) {
            doc.ref.update({edtActivo: true});
            admin.firestore().collection("uso").add({
              usoEdtEstAsigId: doc.data().edtEstAsigId,
              usoEdtGrupo: doc.data().edtGrupo,
              usoEdtNombre: doc.data().edtNombre,
              usoEdtUC: doc.data().edtUCurricular,
              usoMinutos: 0,
              usoOn: Timestamp.fromDate(new Date()),
              usoOff: 0,
            });
          });
        });
    return `EDT Started ${instanceName}`;
  } else {
    functions.logger.info(
        `Saldo INsuficiente ${instanceName} ${saldo}`
    );
    return `EDT NOT Started ${instanceName}`;
  }
  async function startEDT(edtname, edtpid, edtzone) {
    const instancesClient = new compute.InstancesClient();
    const [instance] = await instancesClient.start({
      project: edtpid,
      zone: edtzone,
      instance: edtname,
    });
    let operation = instance.latestResponse;
    const operationsClient = new compute.ZoneOperationsClient();
    // Wait for the operation to complete.
    while (operation.status !== "DONE") {
      [operation] = await operationsClient.wait({
        operation: operation.name,
        project: edtpid,
        zone: operation.zone.split("/").pop(),
      });
    }
    console.log(`EDT Started ${instanceName}`);
  }
});

exports.stopEDT = functions.https.onCall(async (data, context) => {
  // ubicar ultima entrada de edton en enuso
  const instanceName: string = data.instanceName;
  const edtProjectId: string = data.edtProjectId;
  const edtZone: string = data.edtZone;
  console.log("instanceName = ", instanceName);
  console.log("edtProjectId = ", edtProjectId);
  console.log("edtZone = ", edtZone);
  const snapshot = await admin.firestore().collection("uso")
      .where("usoEdtNombre", "==", instanceName.toUpperCase())
      .orderBy("usoOn", "desc").limit(1).get();
  // calcular consumo de saldo
  snapshot.forEach((doc) => {
    const usoOff2 = Timestamp.fromDate(new Date());
    usoMinutos2 = Math.floor(
        (usoOff2.toMillis() - doc.data().usoOn.toMillis()) / 1000 / 60);
    // modificar campos usoMinutos y usoOff en uso
    doc.ref.update(
        {usoMinutos: usoMinutos2, usoOff: usoOff2});
  });
  // setear campo activo a false y descontar consumo de minutos del saldo
  admin.firestore().collection("edts")
      .where("edtNombre", "==", instanceName.toUpperCase())
      .get()
      .then(function(querySnapshot) {
        querySnapshot.forEach(function(doc) {
          doc.ref.update(
              {
                edtActivo: false,
                edtSaldoTiempo: (Math.max(0,
                    (doc.data().edtSaldoTiempo - usoMinutos2))),
              });
        });
      });
  // parar edt en gcloud
  stopEDT(instanceName, edtProjectId, edtZone);
  return `EDT Stoped ${instanceName} manual`;
  async function stopEDT(edtname, edtpid, edtzone) {
    const instancesClient = new compute.InstancesClient();
    const [instance] = await instancesClient.stop({
      project: edtpid,
      zone: edtzone,
      instance: edtname,
    });
    let operation = instance.latestResponse;
    const operationsClient = new compute.ZoneOperationsClient();
    // Wait for the operation to complete.
    while (operation.status !== "DONE") {
      [operation] = await operationsClient.wait({
        operation: operation.name,
        project: edtpid,
        zone: operation.zone.split("/").pop(),
      });
    }
  }
});
exports.saldoTiempoEDT = functions.pubsub
    .schedule("every 5 minutes").onRun(async (context) => {
    // ubicar edts activas
      const snapshot = await admin.firestore().collection("edts")
          .where("edtActivo", "==", true).get();
      snapshot.forEach(async (doc) => {
        const projectId2 = doc.data().edtProjectId.toLowerCase();
        const zone2 = doc.data().edtZone.toLowerCase();
        const edtname2 = doc.data().edtNombre.toLowerCase();
        saldo = Math.max(0,
            (doc.data().edtSaldoTiempo -
            await minutosConsumidosDesdeEdtOn(doc)));
        doc.ref.update(
            {edtSaldoTiempo: saldo});
        // si nuevo saldo es 0 entocnes para EDT
        if (saldo == 0) {
          await stop2EDT(edtname2, projectId2, zone2);
          console.log(`stop2EDT sin toLowerCase ${doc.data().edtNombre}`);
          doc.ref.update({edtActivo: false});
        }
      });
      return null;
      async function stop2EDT(edtNombre2, edtpid2, edtzone2) {
        const instancesClient = new compute.InstancesClient();
        const [instance] = await instancesClient.stop({
          project: edtpid2,
          zone: edtzone2,
          instance: edtNombre2,
        });
        let operation = instance.latestResponse;
        const operationsClient = new compute.ZoneOperationsClient();
        // Wait for the operation to complete.
        while (operation.status !== "DONE") {
          [operation] = await operationsClient.wait({
            operation: operation.name,
            project: edtpid2,
            zone: operation.zone.split("/").pop(),
          });
        }
      }
    });
async function minutosConsumidosDesdeEdtOn(doc: any): Promise<number> {
  const snapshot2 = await admin.firestore().collection("uso")
      .where("usoEdtNombre", "==", doc.data().edtNombre.toUpperCase())
      .orderBy("usoOn", "desc").limit(1).get();
  // calcular consumo de saldo
  snapshot2.forEach((doc2) => {
    const usoOff2 = Timestamp.fromDate(new Date());
    usoMinutos2 = Math.floor(
        (usoOff2.toMillis() - doc2.data().usoOn.toMillis()) / 1000 / 60);
    doc2.ref.update(
        {usoMinutos: usoMinutos2, usoOff: usoOff2});
  });
  return usoMinutos2;
}

