import 'package:json_annotation/json_annotation.dart';

part 'notice_info.g.dart';

@JsonSerializable()
class NoticeInfo {
  NoticeInfo({
    this.boardId,
    this.boardTitle,
    this.createDate,
    this.rnum
  });

  final String? rnum;
  final String? boardId;
  final String? boardTitle;
  final String? createDate;

  factory NoticeInfo.fromJson(Map<String, dynamic> json) => _$NoticeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeInfoToJson(this);

}