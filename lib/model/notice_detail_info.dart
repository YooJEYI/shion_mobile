
import 'package:json_annotation/json_annotation.dart';

part 'notice_detail_info.g.dart';

@JsonSerializable()
class NoticeDetailInfo {
  NoticeDetailInfo( {
    this.boardId,
    this.boardTitle,
    this.boardContent,
    this.file,
  });

   String? boardId;
   String? boardTitle;
   String? boardContent;
   int? file;

  factory NoticeDetailInfo.fromJson(Map<String, dynamic> json) => _$NoticeDetailInfoFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeDetailInfoToJson(this);
}