// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:zion_shel/model/notice_info.dart';
//
// import '../mysql.dart';
//
// Future<List<NoticeInfo>> getNoticeSQLData() async {
//
//   var db = Mysql();
//
//   String sql = 'SELECT A.RNUM as rnum,  A.BOARD_ID, A.BOARD_TITLE, A.BOARD_CREATE_DATE FROM BOARD;';
//       // 'FROM ('
//       // 'SELECT @ROWNUM:=@ROWNUM+1  RNUM, XA.BOARD_ID, XA.BOARD_TITLE, DATE_FORMAT(XA.BOARD_CREATE_DATE,'%Y-%m-%d') AS BOARD_CREATE_DATE'
//       // 'FROM BOARD XA, (SELECT @ROWNUM := 0) R WHERE BOARD_DVSN=1 ORDER BY BOARD_CREATE_DATE DESC'
//       // ' ) A WHERE RNUM BETWEEN #{currentPage}*10-9 AND #{currentPage}*10 ' ;
//
//   final List<NoticeInfo> noticelist = [];
//
//   await db.getConnection().then((conn) async {
//
//     await conn.query(sql).then((results) {
//
//       for (var res in results) {
//
//         final NoticeInfo notice = NoticeInfo(
//
//              rnum: res['rnum'].toString(),
//
//             boardId: res['boardId'].toString(),
//
//             boardTitle: res['boardTitle'].toString(),
//
//             createDate: res['createDate'].toString(),  );
//
//         noticelist.add(notice);
//
//       }
//
//     }).onError((error, stackTrace) {
//
//       print(error);
//
//       return null;
//
//     });
//
//     conn.close();
//
//   });
//   return noticelist;
//
// }
//
// showFutureDBData() {
//
//   return FutureBuilder<List<NoticeInfo>>(
//
//     future: getNoticeSQLData(),
//
//     builder: (BuildContext context, snapshot) {
//
//       if (snapshot.connectionState == ConnectionState.waiting) {
//
//         return const CircularProgressIndicator();
//
//       } else if (snapshot.hasError) {
//
//         return Text(snapshot.error.toString());
//
//       }
//
//       return ListView.builder(
//
//         itemCount: snapshot.data!.length,
//
//         itemBuilder: (context, index) {
//
//           final notice = snapshot.data![index];
//
//           return ListTile(
//
//             leading: Text(notice.boardTitle),
//
//             title: Text(notice.createDate),
//
//             subtitle: Text(notice.boardId),
//
//           );
//
//         },
//
//       );
//
//     },
//
//   );
//
// }