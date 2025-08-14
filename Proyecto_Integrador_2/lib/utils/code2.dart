
import 'dart:io';
import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador_2/utils/DataItem.dart';
import 'package:proyecto_integrador_2/utils/blocClass.dart';

///Clase auxiliar para el proyecto
class Code2
{

  static const darkBlueColor = Color(0xff486579);

  ///Variable para cambiar el valor
  ///del switch main
  static int numSwitch = 0;

  ///Metodo para camabiar el valor de la
  ///variable
  changeBloc(int i){
    numSwitch = i;
  }

  ///Metodo para generar una linea divisoria
  /// -------------- * --------------
  /// para estetica
  static getDivider()
  {
    return Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 15.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ),
          Text("*", style: TextStyle(color: darkBlueColor),),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Divider(
                color: Colors.grey,
              ),
            ),
          ),
        ]
    );
  }

  ///Metodo para mostrar un mensaje en la parte inferior de la pantalla
  ///1- title -> Descripcion
  ///2- time -> tiempo de duracion
  ///3- color -> color del background
  ///4- altura -> espacio que tomara el mensaje en pantalla
  ///5- context -> contexto actual de la pagina
  show(String title, int time, var color, double altura,BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: altura,
          child: Center(
            child: Text(title),
          ),
        ),
        backgroundColor: color,
        duration: Duration(seconds: time),
      ),
    );
  }

  ///Metodo para obtener la altura de la pantalla
  static ScreenSize(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static back(BuildContext con, bool re, int numBloc, MyEvent e)
  {
    if (re != true)
    {
      numSwitch = numBloc;
      con.read<MyBloc>().add(e);
    }
  }

  static List<String> listSearch = [];

  static DataItem? oneCourts =  DataItem(
    name: "Cancha",
    timestamp: DateTime.now(),
    latitude: 18.488216,
    longitude: -69.925432,
    id: '0'
  );

}

