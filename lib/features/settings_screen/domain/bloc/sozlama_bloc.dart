
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sozlama_event.dart';
part 'sozlama_state.dart';

class SozlamaBloc extends Bloc<SozlamaEvent, SozlamaState> {
  SozlamaBloc() : super(SozlamaInitial()) {
    on<SozlamaEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
