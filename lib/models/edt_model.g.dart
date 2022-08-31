// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edt_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EdtAdapter extends TypeAdapter<Edt> {
  @override
  final int typeId = 0;

  @override
  Edt read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Edt(
      edtId: fields[0] as String,
      edtNombre: fields[1] as String,
      edtUrlImagen: fields[2] as String,
      edtEstAsigId: fields[3] as String?,
      edtGrupo: fields[4] as String,
      edtImgBase: fields[5] as String?,
      edtUCurricular: fields[6] as String?,
      edtItr: fields[7] as String?,
      edtActivo: fields[8] as bool?,
      edtReferenteNombre: fields[9] as String?,
      edtSaldoTiempo: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Edt obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.edtId)
      ..writeByte(1)
      ..write(obj.edtNombre)
      ..writeByte(2)
      ..write(obj.edtUrlImagen)
      ..writeByte(3)
      ..write(obj.edtEstAsigId)
      ..writeByte(4)
      ..write(obj.edtGrupo)
      ..writeByte(5)
      ..write(obj.edtImgBase)
      ..writeByte(6)
      ..write(obj.edtUCurricular)
      ..writeByte(7)
      ..write(obj.edtItr)
      ..writeByte(8)
      ..write(obj.edtActivo)
      ..writeByte(9)
      ..write(obj.edtReferenteNombre)
      ..writeByte(10)
      ..write(obj.edtSaldoTiempo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EdtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
