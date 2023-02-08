import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_model/korzina_model.dart';

part 'footitems_state.dart';

class FootItemsCubit extends Cubit<FootItemsState> {
  // List<OshxonaNomiModel> oshxonaNomiCubit;
  List<Maxsulotlar> maxsulotlarBulimiCubit;
  String? title;
  int? id;
  int? price;
  int? number;
  String? image;
  TextEditingController? filter = TextEditingController();

  FootItemsCubit(
      {required this.maxsulotlarBulimiCubit,
      // required this.oshxonaNomiCubit,
      this.image,
      this.number,
      this.title,
      this.id})
      : super(FootItemsState(
          // oshxonaNomi: oshxonaNomiCubit,
          maxsulot: maxsulotlarBulimiCubit,
          id: id,
          title: title,
        ));
  void searchMaxsulot(String query) => emit(FootItemsState(
      maxsulot: maxsulot_list.where((brand) {
        if (query.isNotEmpty) {
          final titleLower = brand.title.toLowerCase();
          // final oshxonaLower = brand.oshxonaNomi.toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower);
        } else {
          return false;
        }
      }).toList(),
      filter: filter));
}
