import 'package:flutter/material.dart';
import 'package:pfltibit/widgets/scroll.dart';
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
    final ScrollController controller = ScrollController();
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 165,
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView.builder(
            shrinkWrap: true,
            controller: controller,
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
      ),
    );
  }
}
