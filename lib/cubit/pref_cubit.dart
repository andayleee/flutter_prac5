import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prac5/cubit/pref_state.dart';

class PrefCubit extends Cubit<PrefState> {
  PrefCubit() : super(PrefState(theme: ThemeData.light()));

  void toogleTheme() {
    if (state.theme == ThemeData.light()) {
      emit(PrefState(theme: ThemeData.dark()));
    } else {
      emit(PrefState(theme: ThemeData.light()));
    }
  }
}
