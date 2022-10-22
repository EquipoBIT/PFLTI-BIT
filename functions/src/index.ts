import * as functions from "firebase-functions";

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

// export const startEDT2 = functions.https.onRequest((request, response) => {
//   functions.logger.info("Start EDT", { structuredData: true });
//   const projectId = "pflti-bit-edts";
//   const zone = "us-central1-a";
//   const instanceName = "edt001";
//   const compute = require("@google-cloud/compute");
//   // List all instances in the given zone in the specified project.
//   async function startEDT2() {
//     const instancesClient = new compute.InstancesClient();
//     const [instance] = await instancesClient.start({
//       project: projectId,
//       zone,
//       instance: instanceName,
//     });
//     let operation = instance.latestResponse;
//     const operationsClient = new compute.ZoneOperationsClient();
//     // Wait for the operation to complete.
//     while (operation.status !== "DONE") {
//       [operation] = await operationsClient.wait({
//         operation: operation.name,
//         project: projectId,
//         zone: operation.zone.split("/").pop(),
//       });
//     }
//     console.log("EDT Started");
//   }
//   startEDT2();
//   response.send("EDT Started");
// });

exports.startEDT = functions.https.onCall(async (data, context) => {
  const projectId = "pflti-bit-edts";
  const zone = "us-central1-a";
  const instanceName:string = data.instanceName; // "edt001";
  functions.logger.info(`EDT Started ${instanceName}`, {structuredData: true});
  const compute = require("@google-cloud/compute");
  async function startEDT() {
    const instancesClient = new compute.InstancesClient();
    const [instance] = await instancesClient.start({
      project: projectId,
      zone,
      instance: instanceName,
    });
    let operation = instance.latestResponse;
    const operationsClient = new compute.ZoneOperationsClient();
    // Wait for the operation to complete.
    while (operation.status !== "DONE") {
      [operation] = await operationsClient.wait({
        operation: operation.name,
        project: projectId,
        zone: operation.zone.split("/").pop(),
      });
    }
    console.log(`EDT Started ${instanceName}`);
  }
  startEDT();
  return `EDT Started ${instanceName}`;
});

exports.stopEDT = functions.https.onCall(async (data, context) => {
  const projectId = "pflti-bit-edts";
  const zone = "us-central1-a";
  const instanceName:string = data.instanceName; // "edt001";
  functions.logger.info(`EDT Stoped ${instanceName}`, {structuredData: true});
  const compute = require("@google-cloud/compute");
  async function stopEDT() {
    const instancesClient = new compute.InstancesClient();
    const [instance] = await instancesClient.stop({
      project: projectId,
      zone,
      instance: instanceName,
    });
    let operation = instance.latestResponse;
    const operationsClient = new compute.ZoneOperationsClient();
    // Wait for the operation to complete.
    while (operation.status !== "DONE") {
      [operation] = await operationsClient.wait({
        operation: operation.name,
        project: projectId,
        zone: operation.zone.split("/").pop(),
      });
    }
    console.log(`EDT Stoped ${instanceName}`);
  }
  stopEDT();
  return `EDT Stoped ${instanceName}`;
});
