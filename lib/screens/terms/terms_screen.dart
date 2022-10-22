import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/blocs.dart';
import '../../repositories/repositories.dart';
import '../screens.dart';

class TermsScreen extends StatelessWidget {
  static const String routeName = '/terms';

  const TermsScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider<TermsBloc>(
        create: (context) => TermsBloc(
          authBloc: BlocProvider.of<AuthBloc>(context),
          userRepository: context.read<UserRepository>(),
        )..add(
            LoadTerms(context.read<AuthBloc>().state.authUser),
          ),
        child: const TermsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          debugPrint('Terms screen Auth Listener');
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
              const Duration(seconds: 1),
              () => Navigator.of(context).pushNamed(LoginScreen.routeName),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text('Terminos y Condiciones')),
          body: BlocBuilder<TermsBloc, TermsState>(
            builder: (context, state) {
              if (state is TermsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                );
              }
              if (state is TermsLoaded) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                    alignment: const Alignment(0, -1 / 3),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ExpansionTile(
                            initiallyExpanded: false,
                            title: Text(
                              'Términos y condiciones de uso de la plataforma',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  '1.- TÉRMINOS Y CONDICIONES GENERALES: Los términos y condiciones de uso que se exponen a continuación (“Términos y Condiciones”), regulan el uso de la plataforma educativa de apoyo a la docencia (la “Plataforma”) que ofrece la Universidad Tecnológica (la “UTEC”) a través del Portal Académico disponible en su sitio web www.utec.edu.uy (“el Portal”). Cualquier persona («Usuario» o en plural «Usuarios») que desee acceder y/o usar el Portal o la Plataforma podrá hacerlo sujetándose a estos Términos y Condiciones de Uso y a su Política de Privacidad, que se considera parte integrante del presente documento.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '2.- ACEPTACIÓN: Estos Términos y Condiciones se consideran aceptados por los Usuarios por el mero hecho de registrarse y utilizar el Portal y/o la Plataforma. En el caso de no aceptarlos, deberán dejarse de utilizar de forma inmediata. La UTEC se reserva el derecho de realizar cambios en estos Términos y Condiciones sin necesidad de preaviso, los que tendrán efecto a partir de la fecha de su publicación. El uso del Portal y/o de la Plataforma constituirá la aceptación de estos cambios.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '3.- OBJETO Y FINALIDAD: El Portal y la Plataforma tienen por objeto y finalidad informar, almacenar, preservar, asistir y difundir la información y servicios de la comunidad universitaria de la UTEC, además de buscar incrementar la formación de calidad contribuyendo a mejorar el sistema de comunicación en la educación universitaria y el acceso al conocimiento en general.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '4.- OBLIGACIONES DEL USUARIO: El Usuario se compromete y obliga a utilizar el Portal y/o la Plataforma de forma diligente, absteniéndose de su utilización con fines o efectos contrarios a las leyes, reglamentos, a la moral y a las buenas costumbres generalmente aceptadas, obligándose especialmente, pero no taxativamente a: a) Utilizar el Portal y/o la Plataforma únicamente para los fines permitidos por estos Términos y Condiciones; b) No atentar contra ningún derecho de una tercera persona, patente, marca, nombre de dominio, modelo u otro derecho de propiedad de cualquier naturaleza, ni atentar contra normas de ética publicitaria o de privacidad o intimidad de las personas; c) No utilizar, brindar o transmitir información falsa, engañosa, difamatoria, amenazante u obscena; d) No hacer uso de ningún tipo de mecanismo, software o rutina computacional para interferir o intentar interferir en el propio trabajo del Portal y/o de la Plataforma; e) No transmitir ningún tipo de virus, caballos de Troya, “gusanos” (worms), bombas de tiempo, cancelbots u otro tipo de programas de computación que tienen por función dañar, perjudicar, interferir, interceptar información o datos clandestinamente, expropiar o afectar por cualquier medio cualquier sistema, archivo o información contenida en el Portal y/o la Plataforma; f) No reproducir, vender, enajenar, almacenar ni ceder total o parcialmente a ningún tercero la información contenida en el Portal y/o la Plataforma; g) Actuar de acuerdo a estos Términos y Condiciones y a utilizar bajo su única y exclusiva responsabilidad los contenidos del Portal y/o de la Plataforma; h) No modificar, alquilar, ceder, prestar, distribuir o crear trabajos derivados basados en el servicio o en el software soporte del Portal y/o de la Plataforma.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '5.- RESPONSABILIDAD DEL USUARIO: El Usuario reconoce y acepta ser el único responsable de cualquier incumplimiento de sus obligaciones previstas en estos Términos y Condiciones de Uso, así como de las consecuencias de dicho incumplimiento. En particular, el Usuario responderá de los daños y perjuicios de cualquier naturaleza que pudiera ocasionar a UTEC como consecuencia del incumplimiento de cualquiera de las obligaciones a las que queda sometido por estos Términos y Condiciones así como por su actuación a través del Portal y/o de la Plataforma.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '6.- DERECHOS DE LA UTEC: La UTEC se reserva el derecho a: a) modificar en cualquier momento estos Términos y Condiciones, sin necesidad de preaviso a los Usuarios; b) modificar, agregar o suprimir cualquier parte o la totalidad de los servicios brindados por el Portal y/o la Plataforma, sin previo aviso; c) denegar o retirar el acceso al Portal y/o a la Plataforma, en cualquier momento y sin necesidad de preaviso, por iniciativa propia o a instancia de un tercero, a aquellos Usuarios que incumplan estos Términos y Condiciones; d) monitorear todas las transferencias que se realizan en el Portal, incluidos, a título de ejemplo, archivos, mensajes, informes, etc.; y e) retirar intervenciones y/o documentación que vulneren las obligaciones y principios establecidos en estos Términos y Condiciones.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '7.- EXCLUSIÓN DE RESPONSABILIDAD: La UTEC no se responsabiliza de las opiniones expresadas por los Usuarios ni de los contenidos o documentos que los mismos compartan a través del Portal y/o de la Plataforma. Tampoco será responsable de ninguna conducta amenazadora, difamatoria, obscena, ofensiva o ilegal de cualquier otra parte ni de cualquier infracción de los derechos de otros, incluidos los derechos de propiedad intelectual. En ningún caso la UTEC se hace responsable de cualquier daño directo o indirecto causado por el uso del Portal y/o de la Plataforma, ya sea por acción u omisión. La UTEC realizará sus mejores esfuerzos para asegurar la disponibilidad del Portal y de la Plataforma, sin interrupciones, así como la ausencia de errores en cualquier transmisión de información que pudiera tener lugar. No obstante, y debido a la naturaleza misma de Internet, no es posible garantizar tales extremos. Asimismo, si el acceso por parte del Usuario pudiera ocasionalmente verse suspendido o restringido a efectos de la realización de trabajos de reparación, mantenimiento o innovación, la UTEC procurará limitar la frecuencia y duración de tales suspensiones o restricciones. La UTEC tampoco será responsable por cualquier virus que pudiera infectar el equipo del Usuario como consecuencia de su acceso al Portal y/o a la Plataforma o a raíz de cualquier transferencia de datos, archivos, imágenes o textos contenidos en los mismos.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '8.- SEGURIDAD: Los únicos responsables de mantener a salvo y evitar el uso por terceros de las contraseñas de acceso al Portal y/o la Plataforma, son los propios Usuarios, no siendo en ningún caso responsabilidad de la UTEC. Por lo tanto, el Usuario reconoce y acepta ser el único responsable frente a la UTEC con respecto a todas las actividades realizadas en relación con su cuenta. Si el Usuario advirtiera cualquier uso no autorizado de su contraseña o de su cuenta, deberá notificarlo inmediatamente a la UTEC.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '9.- LICENCIAS DE LA UTEC: Tanto el software de base del Portal como de la Plataforma se engloban bajo licencias de software de dominio público. Por tanto, El Usuario reconoce y acepta que la UTEC será la responsable sólo de aquellas adaptaciones que descansan sobre el software base y que realiza para maximizar el uso de la Plataforma.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '10.- DISPOSICIONES GENERALES: Toda cuestión o controversia que se suscite en relación con el uso del Portal y/o de la Plataforma estará regida por las leyes de la República Oriental del Uruguay y quedará sometido a los Tribunales de la ciudad de Montevideo. Se consideran válidas todas las notificaciones al Usuario dirigidas vía e-mail a la dirección que tenga registrada ante el Portal y/o en la Plataforma, por correo al domicilio indicado en el registro del Portal, así como por cualquier otro medio fehaciente.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: Text(
                              "Política de privacidad",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  '1.- OBJETO: La presente Política de Privacidad se considera parte integrante de los Términos y Condiciones de Uso de la plataforma educativa de apoyo a la docencia (la “Plataforma”) que ofrece la Universidad Tecnológica (la “UTEC”) a través del Portal Académico disponible en su sitio web www.utec.edu.uy (“el Portal”). Cualquier persona («Usuario» o en plural «Usuarios») que desee acceder y/o usar el Portal o la Plataforma, podrá hacerlo sujetándose a esta Política de Privacidad.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '2.- ALCANCE: El tratamiento de datos personales que se realiza en el Portal y/o en la Plataforma, se rige por lo dispuesto en la Ley N° 18.331, de 11 de agosto de 2008, y el Decreto N° 414/009, de 21 de agosto de 2009, modificativas y concordantes, sobre protección de datos personales y Habeas Data. Al facilitar sus datos de carácter personal, el Usuario declara aceptar plenamente y sin reservas el tratamiento de los mismos por parte de la UTEC, la que se obliga a hacerlo de conformidad con la normativa referida y de acuerdo a la presente Política de Privacidad.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '3.- FINALIDAD: Los datos personales que se recaben serán utilizados con la finalidad de brindar un mejor servicio educativo y facilitar el uso del Portal y de la Plataforma. Los datos personales de los Usuarios serán utilizados exclusivamente para el cumplimiento de dicha finalidad. Respecto de la recolección y tratamiento de datos realizado mediante mecanismos automatizados con el objeto de generar registros de actividad de los Usuarios, UTEC en ningún caso realizará operaciones que impliquen asociar dicha información a algún usuario identificado o identificable.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '4.- REGISTRO: El Usuario garantiza la veracidad y autenticidad de la información y datos que comunique en virtud de la utilización del Portal y de la Plataforma. En tal sentido, será su obligación la de mantener actualizada dicha información y los datos, de forma tal que correspondan a la realidad. Cualquier manifestación falsa o inexacta que se produzca como consecuencia de las informaciones y datos manifestados, así como de los perjuicios que tal información pudiera causar, será responsabilidad única del Usuario. El Usuario acepta y se compromete a no revelar ningún dato sensible sobre sí mismo o de cualquier otra persona, ni otros datos personales que no fueran requeridos expresamente para la suscripción del Usuario y su participación en el Portal y/o en la Plataforma. La mera difusión voluntaria de dichos datos personales implica su consentimiento claro y expreso de divulgación, siendo el Usuario el único responsable por el alcance de dicha difusión.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '5.- RESERVA Y SEGURIDAD: La UTEC se compromete a guardar reserva respecto de los datos de carácter personal del Usuario objeto de tratamiento. Sin perjuicio de ello, el Usuario consiente que la UTEC podrá divulgar su información personal en las formas previstas en estas Políticas o cuando así le sea requerido por una orden judicial o por una norma legal. La UTEC implementará las medidas técnicas y organizativas que se encuentren a su alcance para proteger los datos personales de los Usuarios, a fin de evitar su alteración, pérdida, tratamiento o acceso no autorizado. Sin embargo, la UTEC no se hace responsable por interceptaciones ilegales o violación de sus sistemas o bases de datos por parte de personas no autorizadas, ni de la indebida utilización de la información obtenida por esos medios.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '6.- EJERCICIO DE LOS DERECHOS: El Usuario podrá en todo momento ejercer los derechos de acceso, rectificación, actualización, inclusión y supresión, otorgados por la Ley Nº 18.331, sus modificativas y concordantes, comunicándose con la UTEC a la dirección de correo electrónico ..... aca va el correo de soporte.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                TextButton(
                                    child: const Text('Acepto'),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('usuarios')
                                          .doc(state.user.uId)
                                          .update({'uAceptoTerminos': true});

                                      Timer(
                                        const Duration(seconds: 1),
                                        () => Navigator.of(context)
                                            .pushNamed(HomeScreen.routeName),
                                      );
                                    }),
                                TextButton(
                                    child: const Text('No acepto'),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/login');
                                      context.read<AuthRepository>().signOut();
                                    })
                              ])
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
        ));
  }
}
