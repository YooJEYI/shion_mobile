
// import 'package:zion_shel/model/notice_info.dart';
// import 'package:zion_shel/service/notice_service.dart';
//
// final noticeServiceProvider = Provider<NoticeService>((ref) => NoticeService(ref));
//
// class NoticeListNotifier extends StateNotifier<List<NoticeInfo>> {
//   NoticeListNotifier(this.ref) : super([]);
//   final Ref ref;
//
//   Future<List<NoticeInfo>> getNoticeList({String? keyword, required int pageKey}) async {
//     final noticeService = ref.watch(noticeServiceProvider);
//     return await noticeService.getNoticeItemList(keyword, pageKey).then((value) => value);
//   }
// }
//
// final noticeListProvider = StateNotifierProvider<NoticeListNotifier, List<NoticeInfo>>((ref) => NoticeListNotifier(ref));
// final noticeCountProvider = StateProvider<int>((ref) => 0);
// final noticeKeywordProvider = StateProvider((ref) => '');


//
// class NoticeDetailNotifier extends StateNotifier<NoticeDetailInfo> {
//   NoticeDetailNotifier(this.ref) : super(NoticeDetailInfo());
//   final Ref ref;
//
//   Future<bool> getDetail(String noticeId) async {
//     final noticeService = ref.watch(noticeServiceProvider);
//     NoticeDetailInfo? detailData;
//     try {
//       detailData = await noticeService.getNoticeDetail(noticeId);
//       return true;
//     } on ApiException catch(de) {
//       return false;
//     } on Exception catch(e) {
//       return false;
//     } finally {
//       state = detailData!;
//     }
//   }
// }
//
// final noticeDetailProvider = StateNotifierProvider<NoticeDetailNotifier, NoticeDetailInfo>((ref) => NoticeDetailNotifier(ref));
