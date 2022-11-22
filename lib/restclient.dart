
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:zion_shel/model/notice_detail_info.dart';
import 'package:zion_shel/model/notice_info.dart';
part 'restclient.g.dart';

@RestApi(baseUrl: 'localhost:8082')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/board')
  Future<List<NoticeInfo>> getNoticeList();

  @GET('/board/boardDetail?boardId={boardId}')
  Future<NoticeDetailInfo> getNoticeDetail({@Path() required String boardId});

}