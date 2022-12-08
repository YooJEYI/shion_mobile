
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:mysql1/mysql1.dart';
import 'package:zion_shel/model/notice_info.dart';
import 'package:zion_shel/model/notice_widget.dart';
import 'package:zion_shel/restclient.dart';
import '../common_style.dart';
import 'package:zion_shel/provider/notice_provider.dart';
import 'package:dio/dio.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoticeScreenState();

}

class _NoticeScreenState extends State<NoticeScreen> {

  late RestClient client;

  @override
  void initState(){
    super.initState();

    Dio dio = Dio();
    client = RestClient(dio);

    Future.microtask(() async {
      final resp = await client.getNoticeList();

      print(resp);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }

  @override
  void dispose() {
    // _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                ),
                prefixIcon: Icon(LineAwesomeIcons.search)
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 11, vertical: 11),
          child: Row(
            children: [
              Text("공지목록", style: TextStyle(color: Color(0xff23343B),fontSize: 15, fontWeight: FontWeight.bold),),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 13),
                  width: double.infinity,
                  height: 1,
                  color: const Color(0xffD5D5D5),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        //   alignment: Alignment.topLeft,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     border: Border.all(
        //       color: Colors.grey.shade400,
        //       width: 1,
        //     ),
        //     borderRadius: BorderRadius.circular(5)
        //   ),
        //   child:
        //     Container(
        //     margin: EdgeInsets.only(left: 10,top: 12, bottom: 12, right: 30),
        //     child :
        //   )
        // ),
      ],
    );
  }
}
