import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyectofinal/paginas/principal_cubit.dart';
import 'package:proyectofinal/paginas/principal_estado.dart';

class Simbolos extends StatelessWidget {
  double anchoContenedor;
  Simbolos({this.anchoContenedor});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrincipalCubit, PrincipalEstado>(
      builder: (context, state) {
        return Container(
          width: anchoContenedor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x00000000)),
                  ),
                  child: FlatButton(
                    child: Image.asset(
                      'assets/icono_cero.png',
                      width: 80,
                    ),
                    onPressed: () {
                      context.read<PrincipalCubit>().ponerSimbolo('cero');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x00000000)),
                  ),
                  child: FlatButton(
                    child: Image.asset(
                      'assets/icono_uno.png',
                      width: 80,
                    ),
                    onPressed: () {
                      context.read<PrincipalCubit>().ponerSimbolo('uno');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x00000000)),
                  ),
                  child: FlatButton(
                    child: Center(
                      child: Image.asset(
                        'assets/icono_cinco.png',
                        width: 80,
                      ),
                    ),
                    onPressed: () {
                      context.read<PrincipalCubit>().ponerSimbolo('cinco');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: const Color(0x00000000)),
                  ),
                  child: FlatButton(
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      context.read<PrincipalCubit>().limpiarNivel();
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
