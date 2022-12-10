import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'edt_model.g.dart';

@HiveType(typeId: 0)
class Edt extends Equatable {
  @HiveField(0)
  final String edtId;
  @HiveField(1)
  final String edtNombre;
  @HiveField(2)
  final String edtUrlImagen;
  @HiveField(3)
  final String? edtEstAsigId;
  @HiveField(4)
  final String edtGrupo;
  @HiveField(5)
  final String? edtImgBase;
  @HiveField(6)
  final String? edtUCurricular;
  @HiveField(7)
  final String? edtItr;
  @HiveField(8)
  final bool? edtActivo;
  @HiveField(9)
  final String? edtReferenteNombre;
  @HiveField(10)
  final double? edtSaldoTiempo;
  @HiveField(11)
  final String edtProjectId;
  @HiveField(12)
  final String edtZone;

  const Edt({
    required this.edtId,
    required this.edtNombre,
    required this.edtUrlImagen,
    required this.edtEstAsigId,
    required this.edtGrupo,
    required this.edtImgBase,
    required this.edtUCurricular,
    required this.edtItr,
    required this.edtActivo,
    required this.edtReferenteNombre,
    required this.edtSaldoTiempo,
    required this.edtProjectId,
    required this.edtZone,
  });

  static Edt fromSnapshot(DocumentSnapshot snap) {
    Edt edt = Edt(
      edtId: snap.id,
      edtNombre: snap['edtNombre'],
      edtUrlImagen: snap['edtUrlImagen'],
      edtEstAsigId: snap['edtEstAsigId'],
      edtGrupo: snap['edtGrupo'],
      edtImgBase: snap['edtImgBase'],
      edtUCurricular: snap['edtUCurricular'],
      edtItr: snap['edtItr'],
      edtActivo: snap['edtActivo'],
      edtReferenteNombre: snap['edtReferenteNombre'],
      edtSaldoTiempo: (snap['edtSaldoTiempo'] as num).toDouble(),
      edtProjectId: snap['edtProjectId'],
      edtZone: snap['edtZone'],
    );
    return edt;
  }

  @override
  List<Object?> get props => [
        edtId,
        edtNombre,
        edtUrlImagen,
        edtEstAsigId,
        edtGrupo,
        edtImgBase,
        edtUCurricular,
        edtItr,
        edtActivo,
        edtReferenteNombre,
        edtSaldoTiempo,
        edtProjectId,
        edtZone,
      ];
}
