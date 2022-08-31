import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MyAppBar(
          title: 'UTEC Gestion de EDTs',
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: MyNavBar(screen: routeName),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<UCurricularBloc, UCurricularState>(
                  builder: (context, state) {
                    if (state is UCurricularLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is UCurricularLoaded) {
                      return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                        ),
                        items: state.ucurriculares
                            .map((ucurricular) =>
                                InfoCarouselCard(ucurricular: ucurricular))
                            .toList(),
                      );
                    } else {
                      return Text('Something went wrong.');
                    }
                  },
                ),
                SectionTitle(title: 'EDTs ASIGNADAS'),
                BlocBuilder<EdtBloc, EdtState>(
                  builder: (context, state) {
                    if (state is EdtLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is EdtLoaded) {
                      return EdtCarousel(
                        edts: state.edts.toList(),
                      );
                    } else {
                      return Text('Something went wrong.');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
