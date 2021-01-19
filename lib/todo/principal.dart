import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';
import 'package:proyectofinal/todo/datos.dart';
import 'package:proyectofinal/todo/respuesta.dart';
import 'package:proyectofinal/todo/resultado.dart';
import 'package:proyectofinal/todo/simbolos.dart';

class Principal extends StatelessWidget {
  const Principal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double anchoResultado = MediaQuery.of(context).size.width * .90;
    double anchoNumeroEsperado = MediaQuery.of(context).size.width * .35;
    double anchoNumeroEntrada = MediaQuery.of(context).size.width * .35;
    double anchoTablero = MediaQuery.of(context).size.width * .60;

    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        String titulo = (state.tipo == 0)
            ? 'Maya a Arábigo'
            : (state.tipo == 1)
                ? 'Arábigo a Maya'
                : 'Random';
        String tipo1 = (state.tipo == 0)
            ? 'Arábigo:'
            : (state.tipo == 1)
                ? 'Maya:'
                : '';
        String tipo2 = (state.tipo == 0)
            ? 'Maya:'
            : (state.tipo == 1)
                ? 'Arábigo:'
                : 'Resultado:';
        return Scaffold(
          appBar: AppBar(
            title: Text(titulo),
            backgroundColor: Colors.blue,
          ),
          body: Container(
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.resultado
                    ? Resultado(anchoContenedor: anchoResultado)
                    : Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    tipo2,
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.black),
                                  ),
                                  Respuesta(
                                      anchoContenedor: anchoNumeroEsperado),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    tipo1,
                                    style: TextStyle(
                                        fontSize: 40, color: Colors.black),
                                  ),
                                  Datos(anchoContenedor: anchoNumeroEntrada),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          if (state.elegido)
                            Column(
                              children: [
                                Text(
                                  'Elige un símbolo:',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                ),
                                Simbolos(anchoContenedor: anchoTablero),
                              ],
                            ),
                        ],
                      ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x00000000)),
                  ),
                  child: FlatButton(
                    child: Icon(
                      state.resultado
                          ? Icons.arrow_right_alt_outlined
                          : Icons.check,
                      color: Colors.black,
                      size: 100,
                    ),
                    onPressed: () {
                      if (state.resultado) {
                        return context
                            .read<PrincipalCubit>()
                            .numeroAleatorio(state.tipo);
                      }
                      context.read<PrincipalCubit>().comprobarIgualdad();
                    },
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
