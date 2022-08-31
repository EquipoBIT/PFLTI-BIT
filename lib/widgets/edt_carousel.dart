import 'package:flutter/material.dart';
import '/models/models.dart';

import 'edt_card.dart';

class EdtCarousel extends StatelessWidget {
  final List<Edt> edts;

  const EdtCarousel({
    Key? key,
    required this.edts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: edts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: EdtCard.grilla(edt: edts[index]),
            );
          },
        ),
      ),
    );
  }
}
