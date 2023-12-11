import 'package:app_demo/screens/screens.dart';

class PaginaHandler extends ChangeNotifier{
  int _paginaActual = 0;
  String _artistaSeleccionado = 'Rembrandt van Rijn';
  String _numeroObjeto = 'SK-C-5'; 

  int get paginaActual => _paginaActual;
  String get artistaSeleccionado => _artistaSeleccionado;
  String get numeroObjeto => _numeroObjeto;

  set paginaActual(int value){
    _paginaActual = value;
    notifyListeners();
  }

  set artistaSeleccionado(String  nombre){
    _artistaSeleccionado = nombre;
    notifyListeners();
  }

  set numeroObjeto(String numeroObjeto){
    _numeroObjeto = numeroObjeto;
    notifyListeners();
  }
}