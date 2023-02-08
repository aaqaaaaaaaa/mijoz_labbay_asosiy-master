import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mijoz_labbay/features/korzina_screen/data/korzina_model/korzina_model.dart';

part 'footitems_state.dart';

class SearchFootItemsCubit extends Cubit<SearchFootItemsState> {
  // List<OshxonaNomiModel> oshxonaNomiCubit;
  List<Maxsulotlar> maxsulotlarBulimiCubit;
  String? title;
  int? id;
  int? price;
  int? number;
  String? image;
  TextEditingController? filter = TextEditingController();

  SearchFootItemsCubit(
      {required this.maxsulotlarBulimiCubit,
      // required this.oshxonaNomiCubit,
      this.image,
      this.number,
      this.title,
      this.id})
      : super(SearchFootItemsState(
          // oshxonaNomi: oshxonaNomiCubit,
          maxsulot: maxsulotlarBulimiCubit,
          id: id,
          title: title,
        ));

    void searchMaxsulot(String query) => emit(SearchFootItemsState(
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
