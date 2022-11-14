// import 'package:bywind_mobile/providers/community/notice_provider.dart';
// import 'package:bywind_mobile/styles/common_style.dart';
// import 'package:bywind_mobile/styles/community_style.dart';
// import 'package:bywind_mobile/utils/community_util.dart';
// import 'package:bywind_mobile/widgets/common/badge.dart';
// import 'package:bywind_mobile/widgets/common/common_content_container.dart';
// import 'package:bywind_mobile/widgets/common/detail_file_link_list.dart';
// import 'package:bywind_mobile/widgets/main/main_scaffold.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// class NoticeDetailScreen extends ConsumerStatefulWidget {
//   const NoticeDetailScreen({super.key});
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _NoticeDetailScreenState();
// }
//
// class _NoticeDetailScreenState extends ConsumerState<NoticeDetailScreen> {
//   final _scrollController = ScrollController();
//
//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final detail = ref.watch(noticeDetailProvider);
//
//     return MainScaffold(
//       appBarBottomLineVisible: false,
//       background: Colors.white,
//       body: SingleChildScrollView(
//         controller: _scrollController,
//         child: CommonContentContainer(
//           expanded: false,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           child: Column(
//             children: [
//               RichText(
//                 text: TextSpan(
//                   style: CommunityStyle.detailHeaderTextStyle,
//                   children: [
//                     WidgetSpan(
//                       child: FittedBox(
//                         fit: BoxFit.fitWidth,
//                         child: Badge.bigBadgeCircle (
//                           backgroundColor: CommunityUtil.noticeClsToColor(detail.cls),
//                           text: CommunityUtil.noticeClsToString(detail.cls),
//                         ),
//                       )
//                     ),
//                     const WidgetSpan(child: SizedBox(width: 5)),
//                     TextSpan(text: detail.noticeTitle??'')
//                   ]
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     detail.companyNm??'',
//                     style: CommunityStyle.detailWriterTextStyle
//                   ),
//                   Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 6),
//                     child: const Text('|', style: CommonStyle.subtitlePipeTextStyle)
//                   ),
//                   Text(
//                     detail.insDt??'',
//                     style: CommunityStyle.detailSubTextStyle
//                   )
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Container(
//                 height: 1,
//                 width: double.infinity,
//                 color: const Color(0xffEAEAF2)
//               ),
//               const SizedBox(height: 30),
//               Container(
//                 constraints: const BoxConstraints(minHeight: 50),
//                 child: Align(
//                   alignment: Alignment.topLeft,
//                   child: Text(
//                     detail.content??'',
//                     style: CommunityStyle.detailBodyTextStyle
//                   )
//                 )
//               ),
//               const SizedBox(height: 50),
//               Container(
//                   height: 1,
//                   width: double.infinity,
//                   color: const Color(0xffEAEAF2)
//               ),
//               Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     margin: const EdgeInsets.only(top: 25,bottom: 6),
//                     child: Text('common.attachedFile'.tr(),
//                       style: CommunityStyle.subHeaderTextStyle
//                     )
//                   ),
//                   DetailFileLinkList(fileInfoList:detail?.fileList??[])
//                 ]
//               )
//             ]
//           )
//         )
//       )
//     );
//   }
// }
