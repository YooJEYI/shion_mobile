
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:zion_shel/model/notice_detail_info.dart';
import 'package:zion_shel/model/notice_info.dart';
part 'restclient.g.dart';

@RestApi(baseUrl:'https://xn--4s4bxgm4g1wp.com')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/mobile/board')
  Future<List<NoticeInfo>> getNoticeList();

  @GET('/board/boardDetail?boardId={boardId}')
  Future<NoticeDetailInfo> getNoticeDetail({@Path() required int boardId});

}