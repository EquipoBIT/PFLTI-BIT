import 'package:pfltibit/models/usuario_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';

import '/repositories/repositories.dart';

class AuthRepository extends BaseAuthRepository {
  final auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final UserRepository _userRepository;

  AuthRepository({
    auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ??
            GoogleSignIn.standard(
              scopes: ['email'], // <<<<< VERIFICAR !!!!
            ),
        _userRepository = userRepository;

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final auth.AuthCredential credential;

      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;

      credential = auth.GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then(
        (value) {
          _userRepository.createUser(
            Usuario(
              uId: value.user!.uid,
              uNombreCompleto: value.user!.displayName ?? '',
              uCorreo: value.user!.email ?? '',
              uUrlFoto: value.user!.photoURL.toString(),
              uPerfil:
                  'estudiante', // Si no existe en la BD se crea como estudiante. Si no lo es, luego un admin cambia el perfil !!!!
              uAceptoTerminos: false,
              uActivo: true,
            ),
          );
        },
      );
    } catch (_) {}
  }

  @override
  Stream<auth.User?> get user => _firebaseAuth.userChanges();

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
