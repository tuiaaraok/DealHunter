// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_products_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListOfProductsModelAdapter extends TypeAdapter<ListOfProductsModel> {
  @override
  final int typeId = 1;

  @override
  ListOfProductsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListOfProductsModel(
      name: fields[0] as String,
      price: fields[1] as String,
      description: fields[2] as String,
      imageFriend: fields[4] as Uint8List,
      isSales: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ListOfProductsModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.isSales)
      ..writeByte(4)
      ..write(obj.imageFriend);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListOfProductsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
