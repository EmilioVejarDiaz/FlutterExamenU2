class Gastos {
  final int _cantidad;
  final String _descripcion;
  final String _nombre_gasto;


  Gastos({
    required int cantidad,
    required String descripcion,
    required String nombre_gasto,

  })  : _cantidad = cantidad,
        _descripcion = descripcion,
        _nombre_gasto = nombre_gasto;

  factory Gastos.fromJson(Map<String, dynamic> json) {
    return Gastos(
      cantidad: json['cantidad'],
      descripcion: json['descripcion'],
      nombre_gasto: json['nombre_gasto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cantidad': _cantidad,
      'descripcion': _descripcion,
      'nombre_gasto': _nombre_gasto,
    };
  }

  int get cantidad => _cantidad;
  String get descripcion => _descripcion;
  String get nombre_gasto => _nombre_gasto;
}
