import 'package:app_demo/screens/screens.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PaginaHandler()),
        ChangeNotifierProvider(create: (context) => MuseumService()),
      ],
      child:const MyApp(),
    )
  );
    //const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo App Museo',
      theme: ThemeData(        
        useMaterial3: true,
      ),
      initialRoute: 'Inicio',
      routes: {
        'Inicio':(context) => const Inicio(),
        'Navegacion':(context) => const Navegacion()
      },
    );
  }
}
