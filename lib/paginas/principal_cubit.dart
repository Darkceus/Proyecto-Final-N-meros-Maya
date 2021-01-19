import 'package:bloc/bloc.dart';
import 'dart:math';
import 'package:proyectofinal/paginas/principal_estado.dart';
import 'package:proyectofinal/nivel/nivel.dart';

class PrincipalCubit extends Cubit<PrincipalEstado> {
  PrincipalCubit() : super(PrincipalEstado.inicial());

  numeroAleatorio([int tipoN = 2]) {
    emit(state.copyWith(resultado: false));
    emit(state.copyWith(numeroSeleccionado: Random().nextInt(400) + 1));
    int numero = state.numeroSeleccionado;
    if (numero > 19 && numero != 400) {
      int cociente = numero ~/ 20;
      int residuo = numero % 20;
      asignarNumeroANivel(residuo, 1);
      asignarNumeroANivel(cociente, 2);
    } else {
      if (numero == 400) {
        emit(state.copyWith(
            nivelUno: Nivel(ceros: 1, unos: 0, cincos: 0),
            nivelDos: Nivel(ceros: 1, unos: 0, cincos: 0),
            nivelTres: Nivel(unos: 1, cincos: 0, ceros: 0)));
      } else {
        if (numero < 20) {
          asignarNumeroANivel(numero, 1);
        }
      }
    }
    emit(state.copyWith(tipo: tipoN));
    bool tipo2 = (tipoN == 2)
        ? Random().nextBool()
        : (tipoN == 1)
            ? true
            : false;
    emit(state.copyWith(elegido: tipo2));
  }

  nivelElegido(int nivel) {
    emit(state.copyWith(nivelElegido: nivel));
  }

  numeroResultado(int numero) {
    emit(state.copyWith(numeroResultado: numero));
  }

  limpiarTodo() {
    emit(state.copyWith(
        numeroResultado: 0,
        nivelElegido: 0,
        resultadoNivelDos: Nivel(unos: 0, cincos: 0, ceros: 0),
        resultadoNivelTres: Nivel(unos: 0, cincos: 0, ceros: 0),
        resultadoNivelUno: Nivel(unos: 0, cincos: 0, ceros: 0)));
  }

  comprobarIgualdad() {
    if (state.elegido) {
      if (state.resultadoNivelUno == state.nivelUno &&
          state.resultadoNivelDos == state.nivelDos &&
          state.resultadoNivelTres == state.nivelTres) {
        emit(state.copyWith(comprobarResultado: true, resultado: true));
      } else {
        emit(state.copyWith(comprobarResultado: false, resultado: true));
      }
    } else {
      if (state.numeroResultado == state.numeroSeleccionado) {
        emit(state.copyWith(comprobarResultado: true, resultado: true));
      } else {
        emit(state.copyWith(comprobarResultado: false, resultado: true));
      }
    }
    limpiarTodo();
  }

  limpiarNivel() {
    switch (state.nivelElegido) {
      case 1:
        emit(state.copyWith(
            resultadoNivelUno: Nivel(ceros: 0, unos: 0, cincos: 0)));
        break;
      case 2:
        emit(state.copyWith(
            resultadoNivelDos: Nivel(ceros: 0, unos: 0, cincos: 0)));
        break;
      case 3:
        emit(state.copyWith(
            resultadoNivelTres: Nivel(ceros: 0, unos: 0, cincos: 0)));
        break;
      default:
    }
  }

  ponerSimbolo(String simbolo) {
    switch (state.nivelElegido) {
      case 1:
        if (simbolo == 'uno') {
          if (state.resultadoNivelUno.unos <= 3 &&
              state.resultadoNivelUno.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelUno: Nivel(
                    cincos: state.resultadoNivelUno.cincos,
                    ceros: state.resultadoNivelUno.ceros,
                    unos: state.resultadoNivelUno.unos + 1)));
          }
        }
        if (simbolo == 'cinco') {
          if (state.resultadoNivelUno.cincos <= 2 &&
              state.resultadoNivelUno.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelUno: Nivel(
                    cincos: state.resultadoNivelUno.cincos + 1,
                    ceros: state.resultadoNivelUno.ceros,
                    unos: state.resultadoNivelUno.unos)));
          }
        }
        if (simbolo == 'cero') {
          if (state.resultadoNivelUno.ceros < 1 &&
              state.resultadoNivelUno.cincos == 0 &&
              state.resultadoNivelUno.unos == 0) {
            emit(state.copyWith(
                resultadoNivelUno: Nivel(
                    cincos: state.resultadoNivelUno.cincos,
                    ceros: state.resultadoNivelUno.ceros + 1,
                    unos: state.resultadoNivelUno.unos)));
          }
        }
        break;
      case 2:
        if (simbolo == 'uno') {
          if (state.resultadoNivelDos.unos <= 3 &&
              state.resultadoNivelDos.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelDos: Nivel(
                    cincos: state.resultadoNivelDos.cincos,
                    ceros: state.resultadoNivelDos.ceros,
                    unos: state.resultadoNivelDos.unos + 1)));
          }
        }
        if (simbolo == 'cinco') {
          if (state.resultadoNivelDos.cincos <= 2 &&
              state.resultadoNivelDos.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelDos: Nivel(
                    cincos: state.resultadoNivelDos.cincos + 1,
                    ceros: state.resultadoNivelDos.ceros,
                    unos: state.resultadoNivelDos.unos)));
          }
        }
        if (simbolo == 'cero') {
          if (state.resultadoNivelDos.ceros < 1 &&
              state.resultadoNivelDos.cincos == 0 &&
              state.resultadoNivelDos.unos == 0) {
            emit(state.copyWith(
                resultadoNivelDos: Nivel(
                    cincos: state.resultadoNivelDos.cincos,
                    ceros: state.resultadoNivelDos.ceros + 1,
                    unos: state.resultadoNivelDos.unos)));
          }
        }
        break;
      case 3:
        if (simbolo == 'uno') {
          if (state.resultadoNivelTres.unos <= 3 &&
              state.resultadoNivelTres.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelTres: Nivel(
                    cincos: state.resultadoNivelTres.cincos,
                    ceros: state.resultadoNivelTres.ceros,
                    unos: state.resultadoNivelTres.unos + 1)));
          }
        }
        if (simbolo == 'cinco') {
          if (state.resultadoNivelTres.cincos <= 2 &&
              state.resultadoNivelTres.ceros == 0) {
            emit(state.copyWith(
                resultadoNivelTres: Nivel(
                    cincos: state.resultadoNivelTres.cincos + 1,
                    ceros: state.resultadoNivelTres.ceros,
                    unos: state.resultadoNivelTres.unos)));
          }
        }
        if (simbolo == 'cero') {
          if (state.resultadoNivelTres.ceros < 1 &&
              state.resultadoNivelTres.cincos == 0 &&
              state.resultadoNivelTres.unos == 0) {
            emit(state.copyWith(
                resultadoNivelTres: Nivel(
                    cincos: state.resultadoNivelTres.cincos,
                    ceros: state.resultadoNivelTres.ceros + 1,
                    unos: state.resultadoNivelTres.unos)));
          }
        }
        break;
      default:
    }
  }

  asignarNumeroANivel(int numeroEnNivel, int nivel) {
    switch (numeroEnNivel) {
      case 0:
        Nivel valorEnMaya = Nivel(ceros: 1, unos: 0, cincos: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 1:
        Nivel valorEnMaya = Nivel(unos: 1, cincos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 2:
        Nivel valorEnMaya = Nivel(unos: 2, cincos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 3:
        Nivel valorEnMaya = Nivel(unos: 3, cincos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 4:
        Nivel valorEnMaya = Nivel(unos: 4, cincos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 5:
        Nivel valorEnMaya = Nivel(cincos: 1, unos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 6:
        Nivel valorEnMaya = Nivel(cincos: 1, unos: 1, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 7:
        Nivel valorEnMaya = Nivel(cincos: 1, unos: 2, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 8:
        Nivel valorEnMaya = Nivel(cincos: 1, unos: 3, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 9:
        Nivel valorEnMaya = Nivel(cincos: 1, unos: 4, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 10:
        Nivel valorEnMaya = Nivel(cincos: 2, unos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 11:
        Nivel valorEnMaya = Nivel(cincos: 2, unos: 1, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 12:
        Nivel valorEnMaya = Nivel(cincos: 2, unos: 2, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 13:
        Nivel valorEnMaya = Nivel(cincos: 2, unos: 3, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 14:
        Nivel valorEnMaya = Nivel(cincos: 2, unos: 4, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 15:
        Nivel valorEnMaya = Nivel(cincos: 3, unos: 0, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 16:
        Nivel valorEnMaya = Nivel(cincos: 3, unos: 1, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 17:
        Nivel valorEnMaya = Nivel(cincos: 3, unos: 2, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 18:
        Nivel valorEnMaya = Nivel(cincos: 3, unos: 3, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
      case 19:
        Nivel valorEnMaya = Nivel(cincos: 3, unos: 4, ceros: 0);
        if (nivel == 1) {
          emit(state.copyWith(nivelUno: valorEnMaya));
        } else {
          emit(state.copyWith(nivelDos: valorEnMaya));
        }
        break;
    }
  }
}
