import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '/models/models.dart';
import '/widgets/widgets.dart';

class GrillaScreen extends StatelessWidget {
  static const String routeName = '/grilla';

  static Route route({required UCurricular ucurricular}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => GrillaScreen(ucurricular: ucurricular),
    );
  }

  final UCurricular ucurricular;

  const GrillaScreen({
    super.key,
    required this.ucurricular,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: ucurricular.ucNombre),
      bottomNavigationBar: const MyNavBar(screen: routeName),
      body: BlocBuilder<EdtBloc, EdtState>(
        builder: (context, state) {
          if (state is EdtLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (state is EdtLoaded) {
            final List<Edt> ucurricularEdts = state.edts
                .where((edt) => edt.edtUCurricular == ucurricular.ucNombre)
                .toList();

            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: ucurricularEdts.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: EdtCard.grilla(
                    edt: ucurricularEdts[index],
                  ),
                );
              },
            );
          } else {
            return Flexible(
                child: Text(
              'Algo salio mal, si el problema persiste ponte en contacto con el soporte tecnico',
              style: Theme.of(context).textTheme.headline6,
            ));
          }
        },
      ),
    );
  }
}
