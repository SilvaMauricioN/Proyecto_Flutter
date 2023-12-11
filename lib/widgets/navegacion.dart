import 'package:app_demo/screens/screens.dart';


class Navegacion extends StatefulWidget {
  const Navegacion({super.key});
  @override
  State<Navegacion> createState() => _NavegacionBar();
}

class _NavegacionBar extends State<Navegacion> {
 
  static const List<Widget> _widgetOptions = <Widget>[
    Galeria(),
    Buscador(),
    GaleriaArtista(),
    Obra()
  ];

  @override
  Widget build(BuildContext context) {
    final page = Provider.of<PaginaHandler>(context, listen: true );    

    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text(
          'Museo Risjk',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: _widgetOptions.elementAt(page.paginaActual),
        //_selectedIndex
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.white),
            label: 'Galeria',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.grey),
            activeIcon: Icon(Icons.search, color: Colors.white),
            label: 'Explorar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            activeIcon: Icon(Icons.person, color: Colors.white),
            label: 'Artista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image, color: Colors.grey),
            activeIcon: Icon(Icons.image, color: Colors.white),
            label: 'Cuadro',
          ),
        ],
        currentIndex: page.paginaActual,
        selectedItemColor: Colors.white,
        onTap: (value){
          page.paginaActual = value;
        },
        // (value) => _onItemTapped(value),
        elevation: 0,
        iconSize: 20,
        backgroundColor: Colors.grey[850],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

