import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Grupo extends Equatable {
  final bool gActivo;
  final String gEstudiantes;
  final double gHorasUsoMax;
  final String gItr;
  final String gImgBaseId;
  final String gNombre;
  final String gReferenteId;
  final String gReferenteNombre;
  final String gUCurricularNombre;
  final String gUrlImagen;

  const Grupo({
    required this.gActivo,
    required this.gEstudiantes,
    required this.gHorasUsoMax,
    required this.gItr,
    required this.gImgBaseId,
    required this.gNombre,
    required this.gReferenteId,
    required this.gReferenteNombre,
    required this.gUCurricularNombre,
    required this.gUrlImagen,
  });

  @override
  List<Object?> get props => [
        gActivo,
        gEstudiantes,
        gHorasUsoMax,
        gItr,
        gImgBaseId,
        gNombre,
        gReferenteId,
        gReferenteNombre,
        gUCurricularNombre,
        gUrlImagen,
      ];

  static Grupo fromSnapshot(DocumentSnapshot snap) {
    Grupo grupo = Grupo(
      gActivo: snap['gActivo'],
      gEstudiantes: snap['gEstudiantes'],
      gHorasUsoMax: (snap['gHorasUsoMax'] as num).toDouble(),
      gItr: snap['gItr'],
      gImgBaseId: snap['gImgBaseId'],
      gNombre: snap['gNombre'],
      gReferenteId: snap['gReferenteId'],
      gReferenteNombre: snap['gReferenteNombre'],
      gUCurricularNombre: snap['gUCurricularNombre'],
      gUrlImagen: snap['gUrlImagen'],
    );
    return grupo;
  }
}
