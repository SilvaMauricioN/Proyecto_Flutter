import 'dart:io';

import 'package:app_demo/screens/screens.dart';
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(     
      width: MediaQuery.of(context).size.width * 0.30,
      child: Drawer(        
        child: Container(
          color: Colors.blueGrey[300],
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.jpg"),
                    fit: BoxFit.fill,
                  ),    
                ),
                child: Text(''),
              ),
              ListTile(
                title: const Text('Salir', style: TextStyle(color: Colors.white)),
                trailing: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onTap: () {
                  exit(0);           
                },
              ),
              // Add more ListTiles for other menu items
            ],
          ),
        ),
      ),
    );
  }
}

 