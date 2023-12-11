import 'package:app_demo/screens/screens.dart';

class TarjetaArtista extends StatelessWidget {
  final String nombre;
  final String url;

  const TarjetaArtista({
    super.key,
    required this.nombre, 
    required this.url
  });

  @override
  Widget build(BuildContext context) {
    final handler = Provider.of<PaginaHandler>(context, listen: false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: Offset.zero,
          )
        ],
      ),
      child: Row(
        children: [
          ClipOval(
            child: FadeInImage(
              placeholder: const AssetImage('assets/images/loading.gif'),
              image: NetworkImage(url),
              fit: BoxFit.cover,
              height: 50.0,
              width: 50.0,
            ),
          ),
          InkWell(
            onTap: () {
              handler.artistaSeleccionado = nombre;
              handler.paginaActual = 2;
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Text(
                limitarTexto(nombre),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String limitarTexto(String texto) {
    const int maxNombre = 31;
    return texto.length > maxNombre ? '${texto.substring(0, maxNombre)}...' : texto;
  }
}