class Nivel {
  final int unos;
  final int cincos;
  final int ceros;
  Nivel({this.unos, this.cincos, this.ceros});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Nivel &&
        o.unos == unos &&
        o.cincos == cincos &&
        o.ceros == ceros;
  }

  int get hashcode => unos.hashCode ^ cincos.hashCode ^ ceros.hashCode;
}
