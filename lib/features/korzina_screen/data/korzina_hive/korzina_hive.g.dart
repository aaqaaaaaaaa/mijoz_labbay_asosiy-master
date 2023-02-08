// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'korzina_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KorzinaCardAdapter extends TypeAdapter<KorzinaCard> {
  @override
  final int typeId = 1;

  @override
  KorzinaCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return KorzinaCard(
      title: fields[0] as String,
      image: fields[1] as String,
      number: fields[5] as int,
      id: fields[3] as int,
      price: fields[2] as int,
      izoh: (fields[6] as List).cast<dynamic>(),
      hajmi: (fields[7] as List).cast<dynamic>(),
      tarkibi: fields[8] as String,
      oshxonaNomi: fields[9] as String,
      jamiSumma: fields[11] as int,
      description: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, KorzinaCard obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.number)
      ..writeByte(6)
      ..write(obj.izoh)
      ..writeByte(7)
      ..write(obj.hajmi)
      ..writeByte(8)
      ..write(obj.tarkibi)
      ..writeByte(9)
      ..write(obj.oshxonaNomi)
      ..writeByte(11)
      ..write(obj.jamiSumma)
      ..writeByte(12)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KorzinaCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
