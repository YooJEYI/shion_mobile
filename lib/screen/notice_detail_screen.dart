// import 'package:flutter/material.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';
// import 'package:zion_shel/restclient.dart';
// import 'package:dio/dio.dart';
// class NoticeDetailScreen extends StatefulWidget {
//   const NoticeDetailScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _NoticeDetailScreenState();
// }
//
// class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
//   final _scrollController = ScrollController();
//
//   late RestClient client;
//
//   @override
//   void initState(){
//     super.initState();
//
//     Dio dio = Dio();
//
//     client = RestClient(dio);
//
//     Future.microtask(() async {
//       final resp = await client.getNoticeDetail(boardId: '484');
//
//       print(resp);
//     });
//   }
//
//
//   @override
//   void dispose() {
//     super.dispose();
//     _scrollController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//       controller: _scrollController,
//         child: Container(
//           margin: EdgeInsets.symmetric(vertical: 33,horizontal: 35),
//           child: Column(
//             children: [
//               Text('와디즈 펀딩 참여해주셔서 감사 드립니다.', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 13,horizontal: 88),
//                 child: Text('시온쉼터 |  2022-11-23'),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 13, bottom: 25),
//                 width: double.infinity,
//                 height: 1,
//                 color: const Color(0xffD5D5D5),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text('ssdsdsd'),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 50, bottom: 25),
//                 width: double.infinity,
//                 height: 1,
//                 color: const Color(0xffD5D5D5),
//               ),
//               Container(
//                 alignment: Alignment.centerLeft,
//                 child: Text('첨부파일'),
//               ),
//               Column(
//                 children: [
//                   Container(
//                     alignment: Alignment.centerLeft,
//                     margin: const EdgeInsets.only(top: 25,bottom: 6),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                       color: Color(0xffF2F3F5),
//                       child: Row(
//                         children: [
//                           Icon(LineAwesomeIcons.file),
//                           SizedBox(width: 4,),
//                           Text(
//                             '2022년 11월 후원자 모음.pdf',
//                             style: TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xff23343B),
//                               letterSpacing: -0.7
//                             ),
//                           ),
//                           SizedBox(width: 95,),
//                           Icon(LineAwesomeIcons.download),
//                         ],
//                       ),
//                     ),
//                   ),
//                   // DetailFileLinkList(fileInfoList:detail?.fileList??[])
//                 ]
//               )
//             ],
//           ),
//         )
//       )
//     );
//   }
// }
