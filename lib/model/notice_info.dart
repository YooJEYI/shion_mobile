// import 'package:json_annotation/json_annotation.dart';
//
// part 'notice_info.g.dart';
//
// @JsonSerializable(createToJson: false, ignoreUnannotated: true)
// class NoticeInfo {
//   NoticeInfo({
//     this.cls,
//     this.companyName,
//     this.insDate,
//     this.noticeId,
//     this.noticeTitle
//   });
//
//   @JsonKey(name: 'CLS')
//   final String? cls;
//
//   @JsonKey(name: 'COMPANY_NM')
//   final String? companyName;
//
//   @JsonKey(name: 'INS_DT')
//   final String? insDate;
//
//   @JsonKey(name: 'NOTICE_ID')
//   final String? noticeId;
//
//   @JsonKey(name: 'TITLE')
//   final String? noticeTitle;
//
//   factory NoticeInfo.fromJson(Map<String, dynamic> json) => _$NoticeInfoFromJson(json);
// }