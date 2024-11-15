// Import para jsonDecode
// Import para http

class Dato {
  final int id;
  final String name;
  final String description;
  final String ndwiLink; // link para ndwi
  final String ndtiLink; //link para ndti
  final String area;
  final String dateProccess;
  final String pathRowrc;

  Dato({
    required this.id,
    required this.name,
    required this.description,
    required this.ndwiLink,
    required this.ndtiLink,
    required this.area,
    required this.dateProccess,
    required this.pathRowrc,
  });

  static Future<Dato> fromJsonWithDetails(Map<String, dynamic> json) async {
    return Dato(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      ndwiLink: json['ndwi_link'] ?? '',
      ndtiLink: json['ndti_link'] ?? '',
      area: json['area'] ?? '',
      dateProccess: json['date_proccess'] ?? '',
      pathRowrc: json['path_row_src'] ?? '',
    );
  }




  // Método fromJson para convertir JSON en una instancia de Dato
  factory Dato.fromJson(Map<String, dynamic> json) {
    return Dato(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      ndwiLink: json['ndwi_link'] ?? '',
      ndtiLink: json['ndti_link'] ?? '',
      area: json['area'] ?? '',
      dateProccess: json['date_proccess'] ?? '',
      pathRowrc: json['path_row_src'] ?? '',
    );
  }

  //metodo 2 para instancia de dato
static Future<List<Dato>> fromJsonList(List<dynamic> jsonList) 
async { List<Dato> dataList = [];
 for (var json in jsonList) {
   Dato dato = Dato.fromJson(json);
    dataList.add(dato);
     } return dataList;
 }
}
