import 'package:flutter/material.dart';
import '/models/models.dart';

class InfoCarouselCard extends StatelessWidget {
  final UCurricular? ucurricular;
  final Edt? edt;

  const InfoCarouselCard({
    Key? key,
    this.ucurricular,
    this.edt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.edt == null) {
          Navigator.pushNamed(
            context,
            '/grilla',
            arguments: ucurricular,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20.0,
          bottom: 10.0,
        ),
        child: Stack(
          children: <Widget>[
            Image.network(
              edt == null ? ucurricular!.ucImageUrl : edt!.edtUrlImagen,
              fit: BoxFit.cover,
              width: 1000.0,
            ),
            this.edt == null
                ? Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        edt == null ? ucurricular!.ucNombre : edt!.edtNombre,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
