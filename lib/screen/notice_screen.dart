
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zion_shel/model/notice_info.dart';
import 'package:zion_shel/mysql.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoticeScreenState();

}

class _NoticeScreenState extends State<NoticeScreen> {
  // final _pageSize = InfiniteScrollPageConstant.pageSize;
  // final PagingController<int, NoticeInfo> _pagingController =
  // PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);
  //
  // @override
  // void initState() {
  //   _pagingController.addPageRequestListener((pageKey) {
  //     _fetchPage(pageKey);
  //   });
  //   super.initState();
  // }

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
    var db = new Mysql();
    return Container(

    );
  }
}
