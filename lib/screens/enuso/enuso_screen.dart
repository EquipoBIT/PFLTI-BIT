import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/enuso/enuso_bloc.dart';
import '/widgets/widgets.dart';

class EnUsoScreen extends StatelessWidget {
  static const String routeName = '/enuso';

  const EnUsoScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const EnUsoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: MyAppBar(title: 'EnUso'),
        bottomNavigationBar: MyNavBar(screen: routeName),
        body: GrillaEnUso());
  }
}

class GrillaEnUso extends StatelessWidget {
  const GrillaEnUso({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnUsoBloc, EnUsoState>(
      builder: (context, state) {
        if (state is EnUsoLoading) {
          return const Center(
            child: CircularProgressIndicator(
              key: Key('CircularProgressIndicator'),
              color: Colors.black,
            ),
          );
        }
        if (state is EnUsoLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.builder(
              key: const Key('Grilla En Uso'),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.25,
              ),
              itemCount: state.enuso.edts.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: EdtCard.enuso(
                    edt: state.enuso.edts[index],
                  ),
                );
              },
            ),
          );
        }
        return const Text('Something went wrong!');
      },
    );
  }
}
