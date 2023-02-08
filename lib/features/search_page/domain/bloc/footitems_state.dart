// ignore_for_file: must_be_immutable

part of 'footitems_cubit.dart';

@immutable
class SearchFootItemsState {
  late List<Maxsulotlar> maxsulot;
  // late List<OshxonaNomiModel> oshxonaNomi;
  late String? title;
  late int? id;
  TextEditingController? filter = TextEditingController();

  SearchFootItemsState({
    this.id,
    this.title,
    required this.maxsulot,
     this.filter,
    // required this.oshxonaNomi,
    // required this.oshxonaNomi,
  });
}
