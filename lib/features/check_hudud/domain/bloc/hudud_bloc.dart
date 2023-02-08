import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hudud_event.dart';
part 'hudud_state.dart';

class HududBloc extends Bloc<HududEvent, HududState> {
  HududBloc() : super(HududInitial()) {
    on<HududEvent>((event, emit) {});
  }
}
