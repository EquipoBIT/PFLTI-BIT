import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        color: Colors.black,
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        IconButton(
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
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
          icon: Icon(Icons.handyman),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/enuso',
            );
          },
        ),
      ],
    );
  }

  Size get preferredSize => Size.fromHeight(50.0);
}
