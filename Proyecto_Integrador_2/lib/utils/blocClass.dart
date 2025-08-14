import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

///Clase principal para control de eventos
///de los cuales extiende los eventos
@immutable
abstract class MyEvent {}

///EventA llama al Login
class EventA extends MyEvent {}

///Evento google map page
class EventMapScreen extends MyEvent {}

///Evento google map page MapScreenStaticView
class EventMapScreenStaticView extends MyEvent {}

///Evento page pageCourtsHomeView
class EventPageCourtsHomeView extends MyEvent {}

@immutable
abstract class MyState {}

class StateA extends MyState {}

///Estado google map page
class StateMapScreen extends MyState {}

///Estado google map page MapScreenStaticView
class StateMapScreenStaticView extends MyState {}

///Estado page pageCourtsHomeView
class StatePageCourtsHomeView extends MyState {}

///Clase que controla la accion en base a un evento y un statod
class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(StateA()) {
    ///Acciones a realizar
    ///1- on<{Aqui va el evento}>
    ///2- on<{Aqui va el evento}>((event,emit))
    ///3- on<{Aqui va el evento}>((event,emit) => emit({Aqui va el estado}))
    on<EventA>((event, emit) => emit(StateA()));
    on<EventMapScreen>((event, emit) => emit(StateMapScreen()));

    ///Bloc events MapScreenStaticView
    on<EventMapScreenStaticView>((event, emit) => emit(StateMapScreenStaticView()));

    ///Bloc events pageCourtsHomeView
    on<EventPageCourtsHomeView>((event, emit) => emit(StatePageCourtsHomeView()));
  }
}