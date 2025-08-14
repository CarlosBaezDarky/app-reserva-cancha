//Variables
//-------------------------------------------------------------------
//Variable color, Tono "principal"
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/blocClass.dart';
import '../utils/code2.dart';

//Variable para ajustar el heist de los sizedBox
const _altura = 35.0;

class loginPageWellView extends StatefulWidget {

  @override
  _loginPageWellViewState createState() => _loginPageWellViewState();
}

class _loginPageWellViewState extends State<loginPageWellView> {

 /// ConnectivityResult _connectionStatus = ConnectivityResult.none;
///  final Connectivity _connectivity = Connectivity();
 /// late StreamSubscription<ConnectivityResult> _connectivitySubscription;

 //DataBaseHelper _dbHelper = DataBaseHelper.instance;

  String? userName;
  String? PWD;

  final _formKey = GlobalKey<FormState>();

  var _ctrlUser = TextEditingController();
  var _ctrlPWD = TextEditingController();
  var _ctrlEmail = TextEditingController();

  String txt0 ="Correo Electrónico";
  String txt1 ="Contraseña";
  String btn_Txt = "Enter";
  String titulo = "Login";

  @override
  void initState(){
    super.initState();
    setState(() {
      ////initConnectivity();

     //// _connectivitySubscription =
         //// _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
      //_initValue();
    });
  }

  @override
  void dispose() {
   //// _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        title: Center(
          child: Text(titulo,
            style: TextStyle(color: Color.fromARGB(255, 245, 235, 235),),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _form(),
          ],
        ),
      ),
    );
  }

  int coluVal = 0;
  List<Icon> ico =
  [
    Icon(Icons.visibility_off_rounded,
        size: 18,
        color: Colors.grey),
    Icon(Icons.remove_red_eye_rounded,
        size: 18,
        color: Colors.blue.shade600),
  ];

  _form() =>Expanded(
    child: Container(
      margin:  EdgeInsets.fromLTRB(20, 30, 20, 30),
      //color: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
        //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Form(
          key: _formKey,
          child:  SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SizedBox(height: 2,),
                Container(
                  height: 190,
                  margin: EdgeInsets.fromLTRB( 18, 0, 18, 0),
                  //padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white, // Color de fondo
                    borderRadius: BorderRadius.circular(8), // Opcional: bordes redondeados
                    // Puedes añadir otros efectos si lo deseas
                  ),
                  child: Center(
                    child: Text(
                      "cancha",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Code2.getDivider(),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child:
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: null,
                          minLines: 1,
                          controller: _ctrlUser,
                          decoration: InputDecoration(labelText: txt0,
                            enabled: autoLead,
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.assignment_ind_rounded,
                              color: Code2.darkBlueColor,
                              size: 26,),
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              icon: Icon(Icons.clear,
                                size: 18,),
                              onPressed: () {_ctrlUser.clear();},
                            ),
                          ),
                          onSaved: (val) {
                            userName = val.toString();
                          },
                          validator: (val){
                            if(val!.isEmpty) {
                              return "Complete el campo";
                            }
                          },
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _ctrlPWD,
                          obscureText: seePwd,
                          decoration: InputDecoration(labelText: txt1,
                            enabled: autoLead,
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.lock_rounded,
                              color: Code2.darkBlueColor,
                              size: 26,),
                            suffixIcon: IconButton(
                              splashColor: Colors.transparent,
                              icon: ico[coluVal],
                              onPressed: () {
                                setState(() {
                                  switch(seePwd)
                                  {
                                    case true:
                                      seePwd = false;
                                      coluVal = 1;
                                      break;
                                    case false:
                                      seePwd = true;
                                      coluVal = 0;
                                      break;
                                  }
                                });
                              },
                            ),),
                          onSaved: (val) {
                            PWD = val.toString();
                          },
                          validator: (val) {if(val!.isEmpty) {
                            return "Complete el campo";
                          }
                          },
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10.0),
                              height: 40,
                              width: 100,
                              child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  //primary:  Colors.green,
                                  //onPrimary: Colors.white,
                                  shadowColor: Colors.black54,
                                  shape: StadiumBorder(),
                                ),
                                onPressed: () {
                                   _onSubmit();
                                },
                                child: Text(btn_Txt,
                                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                //icon: cd.icon,
                              ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                      ],
                    ),
                  ),
                ),
                Code2.getDivider(),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  bool seePwd = true;

  _onSubmit() {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if(userName == "usuario@email.com" && PWD == "demo123")
      {
        pass = true;
        print("cambia de pantalla");
        if(pass != false) {
          cd2.show('Sesion lista', 3, Colors.blue.shade600, 20, context);
          cd2.changeBloc(1);
         // context.read<MyBloc>().add(EventMapScreenStaticView());
          context.read<MyBloc>().add(EventPageCourtsHomeView());
        }
      }
      else{
        _ctrlPWD.clear();
      }
    }
  }

  /*_initValue() async{

    pass = false;
    if(await Code3.knowIfSaved() != false) {
      pass = true;
      print('Evaluo la expresion: ' + pass.toString());
      await Code3.getUser();
      _ctrlUser.text = userData.user;
      _ctrlPWD.text = userData.pwd;
    }

    print('Paso la expresion: ' + pass.toString());
  }*/

  late bool pass;

  _clearText(){
    _ctrlUser.clear();
    _ctrlPWD.clear();
  }

  //Code cd = new Code();
  Code2 cd2 = new Code2();
  bool autoLead = true;

  _showAlert()
  {
    AlertDialog alert = AlertDialog(
        title: Text('Procesando sesion'),
        content: Container(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            )
        )
    );

    showDialog(context: context,
        builder:
            (_)=> alert);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  /*Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }*/

  /*Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    Code2 cd2 = Code2();
    switch(result)
    {
      case ConnectivityResult.none:
        cd2.show('Sin conexion a red', 3, Colors.red, 20, context);
        break;
      default:
        break;
    }*/

  ////  _connectionStatus = result;

 //// }

}