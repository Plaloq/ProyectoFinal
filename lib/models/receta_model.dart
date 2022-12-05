class Receta {
  Receta(
    Map map, {
      this.id = '',
        required this.nombre,
        required this.dificultad,
        required this.ingredientes,
        required this.duracion,
        required this.descripcion,
        required this.imagen,
        required this.preparacion,
        required this.categoria,
      }
  );

  String id;
  final String nombre;
  final String dificultad;
  final String ingredientes;
  final String duracion;
  final String descripcion;
  final String imagen;
  final String preparacion;
  final String categoria;

  Map<String, dynamic> toJson() => {
    'id':id,
    'nombre':nombre,
    'dificultad':dificultad,
    'ingredientes':ingredientes,
    'duracion' : duracion,
    'descripcion' : descripcion,
    'imagen': imagen,
    'preparacion': preparacion,
    'categoria': categoria,
  };

  static Receta fromJson(Map<String, dynamic> json) => Receta(
      {},
      nombre: json['nombre'],
      dificultad: json['dificultad'],
      ingredientes: json['ingredientes'],
      duracion: json['duracion'],
      descripcion: json['descripcion'],
      imagen: json['imagen'],
      preparacion: json['preparacion'],
      categoria: json['categoria']);
}