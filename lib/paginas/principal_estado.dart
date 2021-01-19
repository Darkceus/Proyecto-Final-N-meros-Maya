import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:proyectofinal/nivel/nivel.dart';
part 'principal_estado.freezed.dart';

@freezed
abstract class PrincipalEstado with _$PrincipalEstado {
  factory PrincipalEstado({
    @required int numeroSeleccionado,
    @required bool elegido,
    @required int nivelElegido,
    @required Nivel nivelUno,
    @required Nivel nivelDos,
    @required Nivel nivelTres,
    @required Nivel resultadoNivelUno,
    @required Nivel resultadoNivelDos,
    @required Nivel resultadoNivelTres,
    @required int numeroResultado,
    @required bool comprobarResultado,
    @required bool resultado,
    @required int tipo,
  }) = _PrincipalEstado;
  factory PrincipalEstado.inicial() => PrincipalEstado(
      numeroSeleccionado: 0,
      elegido: false,
      nivelElegido: 0,
      nivelUno: Nivel(unos: 0, cincos: 0, ceros: 0),
      nivelDos: Nivel(unos: 0, cincos: 0, ceros: 0),
      nivelTres: Nivel(unos: 0, cincos: 0, ceros: 0),
      resultadoNivelUno: Nivel(unos: 0, cincos: 0, ceros: 0),
      resultadoNivelDos: Nivel(unos: 0, cincos: 0, ceros: 0),
      resultadoNivelTres: Nivel(unos: 0, cincos: 0, ceros: 0),
      numeroResultado: 0,
      comprobarResultado: false,
      resultado: false,
      tipo: 2);
}
