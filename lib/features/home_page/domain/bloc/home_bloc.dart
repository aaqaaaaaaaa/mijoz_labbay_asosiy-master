
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;
  HomeBloc(this.context) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      emit(HomeLoadingState());
    });
    on<HomeLoadingEvent>((event, emit) {
      emit(HomeLoadedState());
      // try {} catch (_) {}
          });
  }
}
