import 'package:app_demo/screens/screens.dart';

class Galeria extends StatelessWidget {
  const Galeria({super.key});

  @override
  Widget build(BuildContext context) {
    final museumService = Provider.of<MuseumService>(context, listen: false);

    return FutureBuilder<List<ObraSimple>>(
      future: museumService.getColeccion(),
      builder: (BuildContext context, AsyncSnapshot<List<ObraSimple>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();         
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<ObraSimple> listaColeccion = snapshot.data!;

          return Center(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300
              ),
              itemCount: listaColeccion.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FullScreen(
                            url: listaColeccion[index].webImage.url,
                            context: context)));
                  },
                  child: Hero(
                    tag: 'imageHero$index',
                    child: GaleriaCard(
                        titulo: limitarTexto(listaColeccion[index].title),
                        subTitulo: listaColeccion[index].principalOrFirstMaker,
                        url: listaColeccion[index].webImage.url,
                        objectNumber: listaColeccion[index].objectNumber,
                        context: context),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
  String limitarTexto(String texto) {
    const int maxNombre = 28;
    return texto.length > maxNombre ? '${texto.substring(0, maxNombre)}..' : texto;
  } 
}
