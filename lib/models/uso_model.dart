import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Uso extends Equatable {
  final String usoEdtEstAsigId;
  final String usoEdtGrupo;
  final String usoEdtNombre;
  final String usoEdtUC;
  final double usoMinutos;
  final Timestamp usoOn;
  final Timestamp usoOff;

  const Uso({
    required this.usoEdtEstAsigId,
    required this.usoEdtGrupo,
    required this.usoEdtNombre,
    required this.usoEdtUC,
    required this.usoMinutos,
    required this.usoOn,
    required this.usoOff,
  });

  static Uso fromSnapshot(DocumentSnapshot snap) {
    Uso uso = Uso(
      usoEdtEstAsigId: snap['usoEdtEstAsigId'],
      usoEdtGrupo: snap['usoEdtGrupo'],
      usoEdtNombre: snap['usoEdtNombre'],
      usoEdtUC: snap['usoEdtUC'],
      usoMinutos: (snap['usoMinutos'] as num).toDouble(),
      usoOn: snap['usoOn'],
      usoOff: snap['usoOff'],
    );
    return uso;
  }

  @override
  List<Object?> get props => [
        usoEdtEstAsigId,
        usoEdtGrupo,
        usoEdtNombre,
        usoEdtUC,
        usoMinutos,
        usoOn,
        usoOff,
      ];
}
