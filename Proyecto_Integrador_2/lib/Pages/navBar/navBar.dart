

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador_2/utils/blocClass.dart';
import 'package:proyecto_integrador_2/utils/code2.dart';

const darkBlueColor = Color(0xff486579);

class navBar extends StatelessWidget {

  //DataBaseHelper _dbHelper = DataBaseHelper.instance;
  bool condicionIf = true;

  String txt0 = "Perfil";
  String txt1 = "Levantamiento";
  String txt2 = "Trabajo";
  String txt3 = "Log out";
  String txt4 = "Configuraciones";
  String txt5 = "Trabajos";
  String txt6 = "Graficas-RealTime";
  String txt7 = "Map Medidores";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    "cancha",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                /*Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("lib/img/LogoTrade_transparencia__horizontal.png"),
                    ),
                  ),
                ),*/
              ],
            ),
          ),
          Code2.getDivider(),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            title: Text(txt0,
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
            trailing: Icon(Icons.keyboard_arrow_right_rounded,
              color: darkBlueColor,
              size: 24.0,
            ),
            onTap: () async{
                // cd.showAlert(context, 'AVISO', 'Página en construcción.');
               // cd.changeBloc(1);
               // context.read<MyBloc>().add(EventA());
             },
          ),
          Code2.getDivider(),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 0),
            title: Text(txt3,
              style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
            trailing: Icon(Icons.keyboard_arrow_right_rounded,
              color: darkBlueColor,
              size: 24.0,
            ),
            onTap: ()async{
              cd.changeBloc(1);
              context.read<MyBloc>().add(EventA());
            },
          ),
          Code2.getDivider(),
        ],
      ),
    );
  }

  Code2 cd = new Code2();
}