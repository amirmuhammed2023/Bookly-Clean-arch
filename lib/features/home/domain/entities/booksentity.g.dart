// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booksentity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class booksentityAdapter extends TypeAdapter<booksentity> {
  @override
  final int typeId = 0;

  @override
  booksentity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return booksentity(
      bookid: fields[0] as String,
      image: fields[1] as String?,
      title: fields[2] as String,
      author: fields[3] as String?,
      rating: fields[4] as num?,
      price: fields[5] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, booksentity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.bookid)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is booksentityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
