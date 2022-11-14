//
// import 'package:zion_shel/model/notice_info.dart';
//
// import '../provider/notice_provider.dart';
//
// class NoticeService extends ApiServiceBase {
//   NoticeService(Ref ref) : super(ref: ref);
//
//   final urlPrefix = '/mobile/community/notice';
//
//   Future<List<NoticeInfo>> getNoticeItemList(String? keyword, int page) async {
//     List<NoticeInfo> noticeList = [];
//     const url = '/getList';
//     var param = {'KEYWORD' : keyword, 'PAGE' : page};
//     final response = await getData(urlPrefix + url, param: param);
//     noticeList = (response.data['list'] as List).map((obj) => NoticeInfo.fromJson(obj)).toList();
//     ref.read(noticeCountProvider.state).state = response.data['listCount'];
//     return noticeList;
//   }
//
//   // Future<NoticeDetailInfo?> getNoticeDetail(String noticeId) async {
//   //   const url = '/getDetail';
//   //   var param = {"NOTICE_ID" : noticeId};
//   //   final response = await getData(urlPrefix + url, param: param);
//   //   Map<String,dynamic> info = response.data;
//   //   return NoticeDetailInfo?.fromJson(info);
//   // }
// }