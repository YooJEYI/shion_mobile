// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_detail_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeDetailInfo _$NoticeDetailInfoFromJson(Map<String, dynamic> json) =>
    NoticeDetailInfo(
      boardId: json['boardId'] as String?,
      boardTitle: json['boardTitle'] as String?,
      boardContent: json['boardContent'] as String?,
      file: json['file'] as int?,
    );

Map<String, dynamic> _$NoticeDetailInfoToJson(NoticeDetailInfo instance) =>
    <String, dynamic>{
      'boardId': instance.boardId,
      'boardTitle': instance.boardTitle,
      'boardContent': instance.boardContent,
      'file': instance.file,
    };
