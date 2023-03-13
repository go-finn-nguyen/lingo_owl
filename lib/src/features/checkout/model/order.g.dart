// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LOrder _$$_LOrderFromJson(Map<String, dynamic> json) => _$_LOrder(
      uid: json['uid'] as String,
      timeStamp: json['timeStamp'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => LItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LOrderToJson(_$_LOrder instance) => <String, dynamic>{
      'uid': instance.uid,
      'timeStamp': instance.timeStamp,
      'items': instance.items,
    };
