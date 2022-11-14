// import 'package:bywind_mobile/models/common/file_info.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'notice_detail_info.g.dart';
//
// @JsonSerializable(createToJson: false, ignoreUnannotated: true)
// class NoticeDetailInfo {
//   NoticeDetailInfo({
//     this.noticeId,
//     this.noticeTitle,
//     this.viewCnt,
//     this.cls,
//     this.content,
//     this.startDt,
//     this.endDt,
//     this.insDt,
//     this.uptDt,
//     this.companyNm,
//     this.companyId,
//     this.fileList
//   });
//
//   @JsonKey(name: 'NOTICE_ID')
//   final String? noticeId;
//
//   @JsonKey(name: 'TITLE')
//   final String? noticeTitle;
//
//   @JsonKey(name: 'VIEW_CNT')
//   final int? viewCnt;
//
//   @JsonKey(name: 'CLS')
//   final String? cls;
//
//   @JsonKey(name: 'CONTENT')
//   final String? content;
//
//   @JsonKey(name: 'START_DT')
//   final String? startDt;
//
//   @JsonKey(name: 'END_DT')
//   final String? endDt;
//
//   @JsonKey(name: 'INS_DT')
//   final String? insDt;
//
//   @JsonKey(name: 'UPT_DT')
//   final String? uptDt;
//
//   @JsonKey(name: 'COMPANY_NM')
//   final String? companyNm;
//
//   @JsonKey(name: 'COMPANY_ID')
//   final String? companyId;
//
//   @JsonKey(name: 'fileList')
//   final List<FileInfo>? fileList;
//
//   factory NoticeDetailInfo.fromJson(Map<String, dynamic> json) => _$NoticeDetailInfoFromJson(json);
// }