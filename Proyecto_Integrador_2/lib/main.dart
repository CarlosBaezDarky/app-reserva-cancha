import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador_2/Pages/ViewCourts/pageCourtsHomeView.dart';
import 'package:proyecto_integrador_2/Pages/ViewMap/MapScreenStaticView.dart';
import 'package:proyecto_integrador_2/utils/blocClass.dart';
import 'package:proyecto_integrador_2/utils/code2.dart';

import 'Pages/ViewMap/MapScreen.dart';
import 'login/loginPageView.dart';

///Color para tema de la app
MaterialColor mycolor = MaterialColor(0xFF2196F3, <int, Color>{
  50: Color(0xFFE3F2FD),
  100: Color(0xFFBBDEFB),
  200: Color(0xFF90CAF9),
  300: Color(0xFF64B5F6),
  400: Color(0xFF42A5F5),
  500: Color(0xFF2196F3),  // Azul primario
  600: Color(0xFF1E88E5),
  700: Color(0xFF1976D2),
  800: Color(0xFF1565C0),
  900: Color(0xFF0D47A1),
}
);

void main() {
  ///Obliga la correcta inicializacion de la aplicacion
  WidgetsFlutterBinding.ensureInitialized();

  ///Metodo para inicializar la app
  runApp(
    ///Constructor para control de navegacion mediante eventos Bloc
    BlocProvider(
      ///Uso de la clase MyBloc como controlador de eventos
      create: (context) => MyBloc(),
      ///Llamada de la aplicacion
      child: MyApp(),
    ),
  );
}

///La clase principal
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(primarySwatch: mycolor),
      ///Uso de Bloc para crear el controlador de navegacion
      ///mediante eventos
      home: BlocBuilder<MyBloc, MyState>(
        builder: (context, state) {
          ///Uso de switch para controlar la navegacion entre vistas
          ///1- Aagregar el caso del switch
          //  case 1:
          //      break;
          ///2- Validar si el state es igual al nuevo estado
          //  case 1:
          //    if(state is MyStateHere)
          //    {
          //
          //    }
          //      break;
          ///3- Colocar el widget o clase a la cual desea navegar
          //  case 1:
          //    if(state is MyStateHere)
          //    {
          //      wdg = MyWidget();
          //    }
          //      break;
          ///Code.numSwitch es la variable global
          ///para controlar el cambio de vista desde las diferentes vistas
          if (state is StateMapScreen) {
            return MapScreen();
          }
          else if (state is StateMapScreenStaticView) {
            return MapScreenStaticView();
          }
          else if (state is StatePageCourtsHomeView){
            return pageCourtsHomeView();
          }
          // Agrega más estados aquí
          return loginPageWellView(); // Estado por defecto
        },
      ),
    );
  }

}
