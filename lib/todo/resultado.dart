import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';

class Resultado extends StatelessWidget {
  final double anchoContenedor;
  const Resultado({this.anchoContenedor});

  List<Widget> obtenerSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  @override
  Widget build(BuildContext context) {
    double anchoNivel = anchoContenedor * .5;
    double altoNivel = 300 * .3;

    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  state.comprobarResultado
                      ? 'Resultado correcto'
                      : 'Resultado incorrecto',
                  style: TextStyle(
                      color:
                          state.comprobarResultado ? Colors.green : Colors.red,
                      fontSize: 35),
                ),
                SizedBox(
                  height: 20,
                ),
                if (!state.comprobarResultado)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Respuesta: ',
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      if (state.elegido)
                        Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: obtenerSimbolo(
                                          state.nivelDos.unos,
                                          Image.asset(
                                            'assets/icono_uno.png',
                                            width: 15,
                                          )),
                                    ),
                                  if (state.nivelDos.cincos > 0)
                                    Column(
                                      children: obtenerSimbolo(
                                          state.nivelDos.cincos,
                                          Image.asset(
                                            'assets/icono_cinco.png',
                                            width: 60,
                                          )),
                                    ),
                                  if (state.nivelDos.ceros > 0)
                                    Image.asset(
                                      'assets/icono_cero.png',
                                      width: 40,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: obtenerSimbolo(
                                        state.nivelUno.unos,
                                        Image.asset(
                                          'assets/icono_uno.png',
                                          width: 15,
                                        ),
                                      ),
                                    ),
                                  if (state.nivelUno.cincos > 0)
                                    Column(
                                      children: obtenerSimbolo(
                                          state.nivelUno.cincos,
                                          Image.asset(
                                            'assets/icono_cinco.png',
                                            width: 60,
                                          )),
                                    ),
                                  if (state.nivelUno.ceros > 0)
                                    Image.asset(
                                      'assets/icono_cero.png',
                                      width: 40,
                                    ),
                                ],
                              ),
                            )
                          ],
                        ),
                      if (state.elegido == false)
                        Text(
                          state.numeroSeleccionado.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 50),
                        ),
                    ],
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
