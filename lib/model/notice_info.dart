import 'package:json_annotation/json_annotation.dart';

part 'notice_info.g.dart';

@JsonSerializable()
class NoticeInfo {
  NoticeInfo({
    this.boardId,
    this.boardTitle,
    this.boardCreateDate,
    this.rnum
  });

  final String? rnum;
  final String? boardId;
  final String? boardTitle;
  final String? boardCreateDate;

  @override
  String toString() {
    return 'NoticeInfo{boardId: $boardId, boardTitle: $boardTitle, boardCreateDate: $boardCreateDate, rnum: $rnum, }';
  }





  factory NoticeInfo.fromJson(Map<String, dynamic> json) => _$NoticeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeInfoToJson(this);

}