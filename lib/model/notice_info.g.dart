// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeInfo _$NoticeInfoFromJson(Map<String, dynamic> json) => NoticeInfo(
      boardId: json['boardId'] as String?,
      boardTitle: json['boardTitle'] as String?,
      boardCreateDate: json['boardCreateDate'] as String?,
      rnum: json['rnum'] as String?,
    );

Map<String, dynamic> _$NoticeInfoToJson(NoticeInfo instance) =>
    <String, dynamic>{
      'rnum': instance.rnum,
      'boardId': instance.boardId,
      'boardTitle': instance.boardTitle,
      'boardCreateDate': instance.boardCreateDate,
    };
