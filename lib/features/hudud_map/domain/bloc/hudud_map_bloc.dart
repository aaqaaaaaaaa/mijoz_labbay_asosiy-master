
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hudud_map_event.dart';
part 'hudud_map_state.dart';

class HududMapBloc extends Bloc<HududMapEvent, HududMapState> {
  HududMapBloc() : super(HududMapInitial()) {
    on<HududMapEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
