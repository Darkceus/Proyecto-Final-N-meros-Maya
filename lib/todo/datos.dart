import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';
import 'package:proyectofinal/nivel/nivel.dart';

class Datos extends StatelessWidget {
  double anchoContenedor;
  Datos({this.anchoContenedor});

  List<Widget> obtenerSimbolo(int numero, Widget simbolo) {
    List<Widget> simbolos = [];
    for (var i = 0; i < numero; i++) {
      simbolos.add(simbolo);
    }
    return simbolos;
  }

  Widget simbolos(Nivel nivel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (nivel.unos > 0)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: obtenerSimbolo(
                nivel.unos,
                Image.asset(
                  'assets/icono_uno.png',
                  width: 15,
                )),
          ),
        if (nivel.cincos > 0)
          Column(
            children: obtenerSimbolo(
                nivel.cincos,
                Image.asset(
                  'assets/icono_cinco.png',
                  width: 60,
                )),
          ),
        if (nivel.ceros > 0)
          Image.asset(
            'assets/icono_cero.png',
            width: 40,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          height: 300,
          child: !state.elegido
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: TextField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, color: Colors.black),
                      decoration: InputDecoration(
                        hintText: '0',
                        hintStyle: TextStyle(color: Colors.black),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      onChanged: (numero) {
                        context
                            .read<PrincipalCubit>()
                            .numeroResultado(int.parse(numero));
                      },
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                            color: state.nivelElegido == 3
                                ? Colors.black12
                                : Colors.white,
                          ),
                          child: FlatButton(
                            child: simbolos(state.resultadoNivelTres),
                            onPressed: () {
                              context.read<PrincipalCubit>().nivelElegido(3);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                            color: state.nivelElegido == 2
                                ? Colors.black12
                                : Colors.white,
                          ),
                          child: FlatButton(
                            child: simbolos(state.resultadoNivelDos),
                            onPressed: () {
                              context.read<PrincipalCubit>().nivelElegido(2);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: anchoContenedor,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2.0, color: const Color(0x00000000)),
                            color: state.nivelElegido == 1
                                ? Colors.black12
                                : Colors.white,
                          ),
                          child: FlatButton(
                            child: simbolos(state.resultadoNivelUno),
                            onPressed: () {
                              context.read<PrincipalCubit>().nivelElegido(1);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
