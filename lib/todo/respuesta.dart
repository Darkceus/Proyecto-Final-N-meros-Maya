import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';

class Respuesta extends StatelessWidget {
  double anchoContenedor;
  Respuesta({this.anchoContenedor});

  List<Widget> obtenerSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  @override
  Widget build(BuildContext context) {
    double anchoNivel = MediaQuery.of(context).size.width;
    double altoNivel = 300 * .3;

    return BlocConsumer<PrincipalCubit, PrincipalEstado>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: const Color(0x00000000)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: state.elegido == false
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                          ),
                          child: state.numeroSeleccionado == 400
                              ? Center(
                                  child: Image.asset(
                                    'assets/icono_uno.png',
                                    width: 20,
                                  ),
                                )
                              : Center(child: Text('')),
                        ),
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.nivelDos.unos > 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: obtenerSimbolo(
                                      state.nivelDos.unos,
                                      Image.asset(
                                        'assets/icono_uno.png',
                                        width: 20,
                                      )),
                                ),
                              if (state.nivelDos.cincos > 0)
                                Column(
                                  children: obtenerSimbolo(
                                      state.nivelDos.cincos,
                                      Image.asset(
                                        'assets/icono_cinco.png',
                                        width: 80,
                                      )),
                                ),
                              if (state.nivelDos.ceros > 0)
                                Image.asset(
                                  'assets/icono_cero.png',
                                  width: 20,
                                ),
                            ],
                          ),
                        ),
                        Container(
                          width: anchoNivel,
                          height: altoNivel,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.nivelUno.unos > 0)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: obtenerSimbolo(
                                    state.nivelUno.unos,
                                    Image.asset(
                                      'assets/icono_uno.png',
                                      width: 20,
                                    ),
                                  ),
                                ),
                              if (state.nivelUno.cincos > 0)
                                Column(
                                  children: obtenerSimbolo(
                                      state.nivelUno.cincos,
                                      Image.asset(
                                        'assets/icono_cinco.png',
                                        width: 80,
                                      )),
                                ),
                              if (state.nivelUno.ceros > 0)
                                Image.asset(
                                  'assets/icono_cero.png',
                                  width: 20,
                                ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Text(
                      state.numeroSeleccionado.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 50),
                    ),
            ),
          ),
        );
      },
    );
  }
}
