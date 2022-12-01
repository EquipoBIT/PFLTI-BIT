import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:math';
import '/blocs/blocs.dart';
import '/models/models.dart';

class EdtCard extends StatelessWidget {
  const EdtCard.grilla({
    Key? key,
    required this.edt,
    this.widthFactor = 2.25,
    this.height = 150,
    this.isGrilla = true,
    this.isEnUso = false,
    this.iconColor = Colors.white,
    this.fontColor = Colors.white,
  }) : super(key: key);

  const EdtCard.enuso({
    Key? key,
    required this.edt,
    this.widthFactor = 1.1,
    this.height = 150,
    this.isGrilla = false,
    this.isEnUso = true,
    this.iconColor = Colors.cyanAccent,
    this.fontColor = Colors.cyanAccent,
  }) : super(key: key);

  final Edt edt;
  final double widthFactor;
  final double height;
  final bool isGrilla;
  final bool isEnUso;
  final Color iconColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double adjWidth = width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/edt',
          arguments: edt,
        );
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          EdtImage(
            adjWidth: adjWidth,
            height: height,
            edt: edt,
          ),
          EdtBackground(
            adjWidth: adjWidth,
            widgets: [
              EdtInformation(
                edt: edt,
                fontColor: fontColor,
              ),
              EdtActions(
                edt: edt,
                isGrilla: isGrilla,
                isEnUso: isEnUso,
                iconColor: iconColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class EdtImage extends StatelessWidget {
  const EdtImage({
    Key? key,
    required this.adjWidth,
    required this.height,
    required this.edt,
  }) : super(key: key);

  final double adjWidth;
  final double height;
  final Edt edt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth,
      height: height,
      child: Image.network(
        edt.edtUrlImagen,
        fit: BoxFit.cover,
      ),
    );
  }
}

class EdtInformation extends StatelessWidget {
  const EdtInformation({
    Key? key,
    required this.edt,
    required this.fontColor,
  }) : super(key: key);

  final Edt edt;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              edt.edtNombre,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: fontColor),
            ),
            Text(
              edt.edtGrupo.substring(0, min(edt.edtGrupo.length, 20)),
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: fontColor),
            ),
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}

class EdtActions extends StatelessWidget {
  const EdtActions({
    Key? key,
    required this.edt,
    required this.isGrilla,
    required this.isEnUso,
    required this.iconColor,
  }) : super(key: key);

  final Edt edt;
  final bool isGrilla;
  final bool isEnUso;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    IconButton removeFromEnUso = IconButton(
      icon: Icon(
        Icons.delete,
        color: iconColor,
      ),
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removido de tu lista de En Uso!'),
          ),
        );
        context.read<EnUsoBloc>().add(RemoveEdtFromEnUso(edt));
      },
    );

    if (isEnUso) {
      return Row(children: [removeFromEnUso]);
    } else {
      return SizedBox();
    }
  }
}

class EdtBackground extends StatelessWidget {
  const EdtBackground({
    Key? key,
    required this.adjWidth,
    required this.widgets,
  }) : super(key: key);

  final double adjWidth;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: adjWidth - 10,
      height: 80,
      margin: const EdgeInsets.only(bottom: 5),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(color: Colors.grey.withAlpha(100)),
      child: Container(
        width: adjWidth - 20,
        height: 70,
        margin: const EdgeInsets.only(bottom: 5),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [...widgets],
          ),
        ),
      ),
    );
  }
}
