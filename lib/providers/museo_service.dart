import 'package:http/http.dart' as http;
import 'package:app_demo/screens/screens.dart';

class MuseumService with ChangeNotifier {
  
  final String baseUrl = 'https://museorijks.onrender.com/api/MuseoRijks';  

  Future<List<Artistas>> getArtistas() async {
    final response = await http.get(Uri.parse('$baseUrl/Artistas'));

    if (response.statusCode == 200) {
      List<Artistas> listaArtistas = artistasFromJson(response.body);      
      return listaArtistas;
    } else {
      throw Exception('Error al Cargar  los Artistas');
    }
  }   

  Future<List<ObraSimple>> getObrasPorArtista(String nombreArtista) async {
    final response = await http.get(Uri.parse('$baseUrl/Obras/Artista?nombreArtista=$nombreArtista'));

    if (response.statusCode == 200) {
      List<ObraSimple> listaObrasArtista = obrasSimpleFromJson(response.body);      
      return listaObrasArtista;
    } else {
      throw Exception('Error al Cargar las Obras del Artista');
    }
  }

  Future<ObraDetalle> getObraPorId(String id) async {
     final response = await http.get(Uri.parse('$baseUrl/Obra/$id'));

    if (response.statusCode == 200) {
      ObraDetalle obraArtista = obraDetalleFromJson(response.body);      
      return obraArtista;
    } else {
      throw Exception('Error al Cargar la Obra');
    }
  }

  Future<List<ObraSimple>> getColeccion() async {
    final response = await http.get(Uri.parse('$baseUrl/Coleccion'));

    if (response.statusCode == 200) {
      List<ObraSimple> listaColecionObras = obrasSimpleFromJson(response.body);      
      return listaColecionObras;
    } else {
      throw Exception('Error al Cargar la Coleccion');
    }
  }

}