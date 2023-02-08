
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'soat_event.dart';
part 'soat_state.dart';

class SoatBloc extends Bloc<SoatEvent, SoatState> {
  SoatBloc() : super(SoatInitial()) {
    on<SoatEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
