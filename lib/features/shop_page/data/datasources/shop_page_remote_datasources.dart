// List<String>
class OshxonaNomiModel {
  String dokonNomi;
  int id;

  OshxonaNomiModel({
    required this.dokonNomi,
    required this.id,
  });

  factory OshxonaNomiModel.fromJson(Map<String, dynamic> json) {
    return OshxonaNomiModel(
      dokonNomi: json['dokon'],
      id: json['id'],
    );
  }
}

// ignore: non_constant_identifier_names
final market_list = <OshxonaNomiModel>[
  OshxonaNomiModel(dokonNomi: 'Dokon1', id: 0),
  OshxonaNomiModel(dokonNomi: 'Dokon2', id: 1),
  OshxonaNomiModel(dokonNomi: 'Dokon3', id: 2),
  OshxonaNomiModel(dokonNomi: 'Dokon4', id: 3),
  OshxonaNomiModel(dokonNomi: 'Dokon5', id: 4),
  OshxonaNomiModel(dokonNomi: 'Dokon6', id: 5),
  OshxonaNomiModel(dokonNomi: 'Dokon7', id: 6),
  OshxonaNomiModel(dokonNomi: 'Dokon8', id: 7),
];
