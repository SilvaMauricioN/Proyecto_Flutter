import 'package:app_demo/screens/screens.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData temaActual;
  ThemeProvider({
    required bool isDarkMode
  }):temaActual = (isDarkMode) ? DefaultTheme.darkTheme : DefaultTheme.defaultTheme;  

  setLight(){
    temaActual = DefaultTheme.defaultTheme;
    notifyListeners();
  }
  
  setDark(){
    temaActual = DefaultTheme.darkTheme;
    notifyListeners();
  }
}
