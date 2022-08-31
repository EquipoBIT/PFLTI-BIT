import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UCurricular extends Equatable {
  final String ucNombre;
  final String ucImageUrl;

  const UCurricular({
    required this.ucNombre,
    required this.ucImageUrl,
  });

  @override
  List<Object?> get props => [
        ucNombre,
        ucImageUrl,
      ];

  static UCurricular fromSnapshot(DocumentSnapshot snap) {
    UCurricular uCurricular = UCurricular(
      ucNombre: snap['ucNombre'],
      ucImageUrl: snap['ucImageUrl'],
    );
    return uCurricular;
  }
}
