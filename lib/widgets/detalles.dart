import 'package:app_demo/screens/screens.dart';

class Detalles extends StatelessWidget {
  final String year;
  final String physicalMedium;
  final String productionPlaces;

  const Detalles({
    super.key,
    required this.year,
    required this.physicalMedium,
    required this.productionPlaces
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DETALLES',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        caracteristicas(Icons.hourglass_empty, year),
        const SizedBox(height: 5),
        caracteristicas(Icons.brush_rounded, physicalMedium),
        const SizedBox(height: 5),
        caracteristicas(Icons.location_on_outlined, productionPlaces),
      ],
    );
  }
  Row caracteristicas(IconData icono, String dato){
    return Row(
      children: [
            Icon(icono),
            const SizedBox(width: 10),  
            Text(
              dato,
              style: const TextStyle(
                fontSize: 20,              
              ),
            ),
          ],
    );
  }
}
