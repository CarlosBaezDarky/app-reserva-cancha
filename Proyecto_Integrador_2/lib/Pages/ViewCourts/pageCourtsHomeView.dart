
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_integrador_2/Pages/navBar/navBar.dart';
import 'package:proyecto_integrador_2/utils/DataItem.dart';
import 'package:proyecto_integrador_2/utils/blocClass.dart';
import 'package:proyecto_integrador_2/utils/code2.dart';

const darkBlueColor = Color(0xff486579);

class pageCourtsHomeView extends StatefulWidget {

  @override
  State<pageCourtsHomeView> createState() => _pageCourtsHomeViewState();
}

class _pageCourtsHomeViewState extends State<pageCourtsHomeView> {

  Code2 cd = new Code2();

  TextEditingController _textFieldController = TextEditingController();

  List<Icon> lead =
  [
    Icon(Icons.location_on,
        color: darkBlueColor,
        size: 35.0),

    Icon(Icons.location_on,
        color: Colors.blue.shade600,
        size: 35.0),
  ];

  List<Icon> _iconsList =[
    Icon(Icons.keyboard_arrow_right_rounded,
      color: Colors.blue.shade600,
      size: 25,),
    Icon(Icons.edit,
      color: Colors.blue.shade600,
      size: 25,),];

  List<DataItem> _datos =  [
    DataItem(
      name: "Centro Olímpico Juan Pablo Duarte",
      timestamp: DateTime.now(),
      latitude: 18.477449,
      longitude: -69.917795,
      id: '1',
    ),
    DataItem(
      name: "Canchas Parque Mirador Sur",
      timestamp: DateTime.now(),
      latitude: 18.443525,
      longitude: -69.953097,
      id: '2',
    ),
    DataItem(
      name: "Club Los Prados",
      timestamp: DateTime.now(),
      latitude: 18.472516,
      longitude: -69.956904,
      id: '3',
    ),
    DataItem(
      name: "Polideportivo UASD",
      timestamp: DateTime.now(),
      latitude: 18.464195,
      longitude: -69.915815,
      id: '4',
    ),
    DataItem(
      name: "Centro de Alto Rendimiento (CAR)",
      timestamp: DateTime.now(),
      latitude: 18.425721,
      longitude: -70.125089,
      id: '5',
    ),
    DataItem(
      name: "Canchas Club Naco",
      timestamp: DateTime.now(),
      latitude: 18.480441,
      longitude: -69.925744,
      id: '6',
    ),
  ];

  int currentIcon = 0;

  String titulo = "Canchas";
  double _divAltura = 15.0;

  @override
  void initState(){
    super.initState();
  }

  bool re = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async
      {
        Code2.back(context, re, 1, EventA());
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.blue.shade600,
          title: Center(
              child: Text(titulo,
                style: TextStyle(
                  color: Color.fromARGB(255, 245, 235, 235),
                ),
              )
          ),
          /*actions: [
            IconButton(
              onPressed: () {
                // method to show the search bar
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate()
                  );
              },
              icon: const Icon(Icons.search),
            )
          ],*/
          automaticallyImplyLeading: true,
        ),
        drawer: navBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              //Cambiar luego
              _List_2(_datos,_iconsList[currentIcon]),
            ],
          ),
        ),
      ),
    );
  }

  _List_2(List<DataItem> datos, Icon iconCurrent) => Expanded(
    child: Container(
      child: ListView.builder(
        itemBuilder: (BuildContext, index){
          int rindex = datos.length - 1 - index;
          var data = datos[rindex];
          return Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                    leading: lead[0],
                    title: Text(data.name.toString().toUpperCase(),
                      //data.Name!.toUpperCase(),
                      style: TextStyle(color: darkBlueColor,
                          fontWeight: FontWeight.bold),),
                    subtitle: Text("Registro: " + data.timestamp.toString(),
                    ),
                    trailing: iconCurrent,
                    onTap: () async{
                      //newModelWell.pass = await _dbHelper.getModelWell_ByName(data) as newModelWell;
                      Code2.oneCourts = datos[rindex];
                      //if(currentIcon != 1) {
                        cd.changeBloc(2);
                        context.read<MyBloc>().add(EventMapScreenStaticView());
                      //}
                    },
                  ),
                  Code2.getDivider(),
                ]
            ),
          );
        },
        itemCount: datos.length,
      ),
    ),
  );
}

///Searchbar...
class CustomSearchDelegate extends SearchDelegate{

  final List<String> listDescription = ["Registro 1","Registro 2","Registro 3","Registro 4","Registro 5"];
  //Code2.listSearch;

  List<Icon> iconList =
  [
    Icon(Icons.location_on,
      color: darkBlueColor,
      size: 35,),
    Icon(Icons.location_on,
        color: Colors.green.shade600,
        size: 35),
  ];

  List<DataItem> _datos =  [
    DataItem(
      name: "Centro Olímpico Juan Pablo Duarte",
      timestamp: DateTime.now(),
      latitude: 18.477449,
      longitude: -69.917795,
      id: '1',
    ),
    DataItem(
      name: "Canchas Parque Mirador Sur",
      timestamp: DateTime.now(),
      latitude: 18.443525,
      longitude: -69.953097,
      id: '2',
    ),
    DataItem(
      name: "Club Los Prados",
      timestamp: DateTime.now(),
      latitude: 18.472516,
      longitude: -69.956904,
      id: '3',
    ),
    DataItem(
      name: "Polideportivo UASD",
      timestamp: DateTime.now(),
      latitude: 18.464195,
      longitude: -69.915815,
      id: '4',
    ),
    DataItem(
      name: "Centro de Alto Rendimiento (CAR)",
      timestamp: DateTime.now(),
      latitude: 18.425721,
      longitude: -70.125089,
      id: '5',
    ),
    DataItem(
      name: "Canchas Club Naco",
      timestamp: DateTime.now(),
      latitude: 18.480441,
      longitude: -69.925744,
      id: '6',
    ),
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      hintColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
        brightness: Brightness.dark, // Añade esto para que coincida
      ).copyWith(
        secondary: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.grey.shade100,
      brightness: Brightness.dark, // Esto ahora coincidirá con el ColorScheme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.green,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext){
    return [
      IconButton(
          icon: const Icon(Icons.clear, size: 20,),
          onPressed:(){
            query ='';
          }
      )
    ];
  }

  @override
  IconButton buildLeading (BuildContext context){
    return IconButton(
        icon: const Icon(Icons.keyboard_arrow_left_rounded),
        onPressed: (){
          close(context, null);
        }
    );
  }

  @override
  ListView buildResults(BuildContext){
    List<String> matchQuery = [];
    for(var fruit in listDescription){
      if(fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index){
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: (){
          },
        );
      },
    );
  }

  @override
  ListView buildSuggestions(BuildContext){
    List<String> matchQuery = [];
    //List<String>
    for(var fruit in listDescription){
      if(fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context,index){
          var description = matchQuery[index];
          int indexWell = _datos.indexWhere((e) => e.name == description);
          print(indexWell);
          var fechaRegistro = _datos[indexWell].timestamp;
          return Container(
            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
                children: [
                  ListTile(
                      leading: iconList[0],
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      title: Text(description,
                        style: TextStyle(
                            color: Code2.darkBlueColor,
                            fontWeight: FontWeight.bold),),
                      subtitle: Text('Registro: ' + fechaRegistro.toString(),
                        style: TextStyle(color: Colors.grey.shade600),),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded,
                        color: Colors.green,
                        size: 25,),
                      onTap: () async {
                        //query = description;
                        //print(query);
                        //newModelWell model = newModelWell.ct;
                        //model.Name = description;
                        //var result = await _dbHelper.getModelWell_ByName(model);
                        //if(result != null)
                        //{
                          //newModelWell.pass = result;
                          //newModelWell.view = true;
                          //cd.changeBloc(1);
                          //context.read<MyBloc>().add(EventMapScreenStaticView());
                          //close(context, null);
                        //}
                      }
                  ),
                  Code2.getDivider(),
                ]
            ),
          );
        }
    );
  }

  Code2 cd = new Code2();
}



