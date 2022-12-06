import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: const MyAppBar(
          title: 'UTEC Gestion de EDTs',
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const MyNavBar(screen: routeName),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<UCurricularBloc, UCurricularState>(
                  builder: (context, state) {
                    if (state is UCurricularLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is UCurricularLoaded) {
                      return Container(
                        constraints: new BoxConstraints(
                          maxHeight: 320,
                          maxWidth: 800,
                        ),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: 320,
                            aspectRatio: 1.5,
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                          ),
                          items: state.ucurriculares
                              .map((ucurricular) =>
                                  InfoCarouselCard(ucurricular: ucurricular))
                              .toList(),
                        ),
                      );
                    } else {
                      return Flexible(
                          child: Text(
                        'Algo salio mal, si el problema persiste ponte en contacto con el soporte tecnico',
                        style: Theme.of(context).textTheme.headline6
                      ));
                    }
                  },
                ),
                const SectionTitle(title: 'EDTs ASIGNADAS'),
                BlocBuilder<EdtBloc, EdtState>(
                  builder: (context, state) {
                    if (state is EdtLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is EdtLoaded) {
                      return EdtCarousel(
                        edts: state.edts.toList(),
                      );
                    } else {
                      return Flexible(
                          child: Text(
                        'Algo salio mal, si el problema persiste ponte en contacto con el soporte tecnico',
                        style: Theme.of(context).textTheme.headline6
                      ));
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
