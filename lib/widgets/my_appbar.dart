import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;

  const MyAppBar({
    Key? key,
    required this.title,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var userImage = user?.photoURL;
    var nonulluserImage = userImage ?? 'assets/images/logo_bit';

    Uri pdf = Uri.https('pfltibit.page.link', '/oN6u');
    Future<void>? _launched;
    Future<void> _launchInBrowser(Uri url) async {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw 'No se puede acceder $url';
      }
    }

    String email = Uri.encodeComponent('pflti-equipo-bit@googlegroups.com');

    Uri mail = Uri.parse('mailto:$email');

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 10,
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: Container(
        width: 100,
        height: 120,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset('assets/images/logo_bit.png'),
                  tooltip: 'Pagina principal / Volver',
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
                IconButton(
                  tooltip: 'Perfil de usuario y cerrar sesión',
                  icon: ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Image.network(nonulluserImage),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/profile',
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Lista de tus EDTs en uso',
                  icon: Icon(Icons.handyman),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/enuso',
                    );
                  },
                ),
                IconButton(
                  tooltip: 'Enviar correo a Soporte Tecnico',
                  icon: Icon(Icons.email),
                  onPressed: () async {
                    if (await launchUrl(mail)) {
                    } else {}
                  },
                ),
                IconButton(
                  tooltip: 'Ver PDF guia - FAQ',
                  icon: Icon(Icons.quiz),
                  onPressed: () async {
                    _launched = _launchInBrowser(pdf);
                    /*if (await launchUrl(pdf)) {
                    } else {}*/
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(70.0);
}
