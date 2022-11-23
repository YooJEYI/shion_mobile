import 'package:flutter/material.dart';

class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
      controller: _scrollController,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 33,horizontal: 35),
          child: Column(
            children: [
              Text('와디즈 펀딩 참여해주셔서 감사 드립니다.', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 13,horizontal: 88),
                child: Text('시온쉼터 |  2022-11-23'),
              ),
              Container(
                margin: EdgeInsets.only(top: 13, bottom: 25),
                width: double.infinity,
                height: 1,
                color: const Color(0xffD5D5D5),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('ssdsdsd'),
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 25),
                width: double.infinity,
                height: 1,
                color: const Color(0xffD5D5D5),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text('첨부파일'),
              ),
            ],
          ),
        )
      )
    );
  }
}
