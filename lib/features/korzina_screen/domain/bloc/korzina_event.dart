part of 'korzina_bloc.dart';

@immutable
abstract class KorzinaEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class KorzinaInitialEvent extends KorzinaEvent {}

class KorzinaAddEvent extends KorzinaEvent {
  final int id;
  final int price;
  final List hajmi;
  final int number;
  final List izoh;
  final String title;
  final int jamiSumma;
  final String tarkibi;
  final String description;
  final String oshxonaNomi;
  final String image;

  KorzinaAddEvent({
    required this.id,
    required this.izoh,
    required this.description,
    required this.price,
    required this.hajmi,
    required this.title,
    required this.image,
    required this.number,
    required this.oshxonaNomi,
    required this.jamiSumma,
    required this.tarkibi,
  });
}

class KorzinaEditEvent extends KorzinaEvent {
  final String title;
  final String image;
  final String description;
  final int price;
  final List hajmi;
  final List izoh;
  final int jamiSumma;
  final String tarkibi;
  final String oshxonaNomi;
  final int id;
  final int number;

  KorzinaEditEvent({
    required this.title,
    required this.image,
    required this.number,
    required this.description,
    required this.izoh,
    required this.hajmi,
    required this.id,
    required this.price,
    required this.oshxonaNomi,
    required this.jamiSumma,
    required this.tarkibi,
  });
}

class KorzinaDeleteEvent extends KorzinaEvent {
  final int index;

  KorzinaDeleteEvent({required this.index});
}
