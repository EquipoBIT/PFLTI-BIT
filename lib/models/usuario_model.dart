import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

//enum Perfil { estudiante, docente, administrativo }
//enum EstadoDelUsuario { activo, inactivo, suspendido, bajalogica }

class Usuario extends Equatable {
  final String? uId;
  final String uCorreo;
  final String uNombreCompleto;
  final String uUrlFoto;
  final String uPerfil;
  final bool uActivo;
  final bool uAceptoTerminos;

  const Usuario({
    this.uId,
    this.uCorreo = '',
    this.uNombreCompleto = '',
    this.uUrlFoto = '',
    this.uPerfil = 'estudiante',
    this.uActivo = true,
    this.uAceptoTerminos = false,
  });

  Usuario copyWith({
    String? uId,
    String? uCorreo,
    String? uNombreCompleto,
    String? uUrlFoto,
    String? uPerfil,
    bool? uActivo,
    bool? uAceptoTerminos,
  }) {
    return Usuario(
      uId: uId ?? this.uId,
      uCorreo: uCorreo ?? this.uCorreo,
      uNombreCompleto: uNombreCompleto ?? this.uNombreCompleto,
      uUrlFoto: uUrlFoto ?? this.uUrlFoto,
      uPerfil: uPerfil ?? this.uPerfil,
      uActivo: uActivo ?? this.uActivo,
      uAceptoTerminos: uAceptoTerminos ?? this.uAceptoTerminos,
    );
  }

  factory Usuario.fromSnapshot(DocumentSnapshot snap) {
    return Usuario(
      uId: snap.id,
      uCorreo: snap['uCorreo'],
      uNombreCompleto: snap['uNombreCompleto'],
      uUrlFoto: snap['uUrlFoto'],
      uPerfil: snap['uPerfil'],
      uActivo: snap['uActivo'],
      uAceptoTerminos: snap['uAceptoTerminos'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'uCorreo': uCorreo,
      'uNombreCompleto': uNombreCompleto,
      'uUrlFoto': uUrlFoto,
      'uPerfil': uPerfil,
      'uActivo': uActivo,
      'uAceptoTerminos': uAceptoTerminos
    };
  }

  @override
  List<Object?> get props => [
        uId,
        uCorreo,
        uNombreCompleto,
        uUrlFoto,
        uPerfil,
        uActivo,
        uAceptoTerminos
      ];
}
