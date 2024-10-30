import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:servicio_satelital/models/dato.dart';


class DatoService {
  final String _baseUrl = 'http://54.174.7.54:8070/api/servicio-satelital';

  Future<List<Dato>> getAllData() async {
    final url = '$_baseUrl/allData';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      List<Dato> datos = [];
      for (var item in data) {
        Dato dato = Dato.fromJson(item);
        datos.add(dato);
      }
      return datos;
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  Future<Dato> getDatoDetails(int id) async {
    final url = '$_baseUrl/searchDataById/$id';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final detailData = jsonDecode(response.body);
      return Dato.fromJson(detailData);
    } else {
      throw Exception('Error al obtener detalles del dato con ID $id');
    }
  }

  Future<Dato> createDato(Dato dato) async {
    final url = '$_baseUrl/saveData';
    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'id': dato.id,
        'name': dato.name,
        'description': dato.description,
        'ndwi_link': dato.ndwiLink,
        'ndti_link': dato.ndtiLink,
        'area': dato.area,
        'date_proccess': dato.dateProccess,
        'path_row_src': dato.pathRowrc,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Dato.fromJson(data);
    } else {
      throw Exception('Error al crear el dato');
    }
  }
}
