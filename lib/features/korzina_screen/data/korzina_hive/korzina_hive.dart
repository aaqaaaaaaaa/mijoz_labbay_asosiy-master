import 'package:hive/hive.dart';

// part 'group.g.dart';
part 'korzina_hive.g.dart';

@HiveType(typeId: 1)
class KorzinaCard extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String image;
  @HiveField(2)
  int price;
  @HiveField(3)
  int id;
  @HiveField(5)
  int number;
  @HiveField(6)
  List izoh;
  @HiveField(7)
  List  hajmi;
  @HiveField(8)
  String tarkibi;
  @HiveField(9)
  String oshxonaNomi;
  @HiveField(11)
  int jamiSumma;
  @HiveField(12)
  String description;


  KorzinaCard({
    required  this.title,
    required this.image,
    required this.number,
    required this.id,
    required this.price,
    required this.izoh,
    required this.hajmi,
    required this.tarkibi,
    required this.oshxonaNomi,
    required this.jamiSumma,
    required this.description
  });
}
//flutter packages pub run build_runner build