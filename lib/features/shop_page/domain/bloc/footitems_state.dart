// ignore_for_file: must_be_immutable

part of 'footitems_cubit.dart';

@immutable
class FootItemsState {
  late List<Maxsulotlar> maxsulot;
  TextEditingController? filter = TextEditingController();

  // late List<OshxonaNomiModel> oshxonaNomi;
  late String? title;
  late int? id;

  FootItemsState({
    this.id,
    this.title,
    required this.maxsulot,
    this.filter,
    // required this.oshxonaNomi,
  });
}
