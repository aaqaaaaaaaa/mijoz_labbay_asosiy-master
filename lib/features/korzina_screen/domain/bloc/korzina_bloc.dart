import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/database/database.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_hive/korzina_hive.dart';

part 'korzina_event.dart';

part 'korzina_state.dart';

class KorzinaBloc extends Bloc<KorzinaEvent, KorzinaState> {
  final Database cardDatabase;
  List<KorzinaCard> cards = [];

  KorzinaBloc(this.cardDatabase) : super(KorzinaInitial()) {
    on<KorzinaInitialEvent>((event, emit) async {
      emit(KorzinaLoadingState());
      await getCard();
      emit(YourKorzinaState(cards: cards));
    });
    on<KorzinaAddEvent>((event, emit) async {
      emit(KorzinaLoadingState());
      await korzinaAdd(
        description: event.description,
          hajmi: event.hajmi,
          izoh: event.izoh,
          price: event.price,
          image: event.image,
          title: event.title,
          id: event.id,
          number: event.number,
          oshxonaNomi: event.oshxonaNomi,
          jamiSumma: event.jamiSumma,
          tarkibi: event.tarkibi);
      emit(YourKorzinaState(cards: cards));
    });
    on<KorzinaEditEvent>((event, emit) async {
      emit(KorzinaLoadingState());
      await korzinaUpdate(
          izoh: event.izoh,
          price: event.price,
          image: event.image,
          title: event.title,
          id: event.id,
          number: event.number,
          hajmi: event.hajmi,
          oshxonaNomi: event.oshxonaNomi,
          jamiSumma: event.jamiSumma,
          tarkibi: event.tarkibi,
          description: '');
      emit(YourKorzinaState(cards: cards));
    });
    on<KorzinaDeleteEvent>((event, emit) async {
      emit(KorzinaLoadingState());
      await deleteCard(index: event.index);
      cards.sort((a, b) {
        var aData = a.title;
        var bData = b.title;
        return aData.compareTo(bData);
      });
      emit(YourKorzinaState(cards: cards));
    });
  }

  Future<void> getCard() async {
    await cardDatabase.getFullNote().then((value) => cards = value);
  }

  Future<void> deleteCard({required int index}) async {
    await cardDatabase.deleteElement(index);
    await getCard();
  }

  Future<void> korzinaAdd(
      {required String title,
      required String image,
      required int price,
      required List izoh,
      required List hajmi,
      required int id,
      required int jamiSumma,
      required String tarkibi,
      required String description,
      required String oshxonaNomi,
      required int number}) async {
    await cardDatabase.addElement(KorzinaCard(
        description: description,
        hajmi: hajmi,
        izoh: izoh,
        price: price,
        image: image,
        title: title,
        id: id,
        number: number,
        tarkibi: tarkibi,
        jamiSumma: jamiSumma,
        oshxonaNomi: oshxonaNomi));
    await getCard();
  }

  Future<void> korzinaUpdate(
      {required String title,
      required String image,
      required String description,
      required int price,
      required List izoh,
      required List hajmi,
      required int id,
      required int jamiSumma,
      required String oshxonaNomi,
      required String tarkibi,
      required int number}) async {
    await cardDatabase.updateElement(
      id,
      KorzinaCard(
        description: description,
        tarkibi: tarkibi,
        oshxonaNomi: oshxonaNomi,
        jamiSumma: jamiSumma,
        hajmi: hajmi,
        izoh: izoh,
        price: price,
        image: image,
        title: title,
        id: id,
        number: number,
      ),
    );
    await getCard();
  }
}
