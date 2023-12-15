import 'package:app_demo/screens/screens.dart';

class Descripcion extends StatelessWidget {
  final String description;

  const Descripcion({
    super.key,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DESCRIPCIÓN',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          margin: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  agregarSaltoDeLinea(description),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  
  String agregarSaltoDeLinea(String texto) {
    return texto.replaceAll(".", ".\n\n");
  }
}