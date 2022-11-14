//
//
// abstract class ApiServiceBase {
//   ApiServiceBase({required this.ref});
//   final Ref ref;
//
//   Future<Dio> generateDio() async {
//     final apiConfiguration = ref.watch(apiConfigurationProvider);
//     final authInfo = ref.watch(authInfoProvider);
//     final timeZoneOffsetMinutes = DateTime.now().toLocal().timeZoneOffset.inMinutes;
//     int timeZoneOffsetH = (timeZoneOffsetMinutes / 60).floor();
//     int timeZoneOffsetM = timeZoneOffsetMinutes % 60;
//     String timeZoneOffsetHString = '00';
//     String timeZoneOffsetMString = '00';
//
//     if (timeZoneOffsetH.abs().toString().length == 1) {
//       timeZoneOffsetHString = '0${timeZoneOffsetH.abs().toString()}';
//     } else {
//       timeZoneOffsetHString = timeZoneOffsetH.abs().toString();
//     }
//
//     if (timeZoneOffsetH * -1 > 0) {
//       timeZoneOffsetHString = '-$timeZoneOffsetHString';
//     } else {
//       timeZoneOffsetHString = '+$timeZoneOffsetHString';
//     }
//
//     if (timeZoneOffsetM.toString().length == 1) {
//       timeZoneOffsetMString = '0${timeZoneOffsetM.toString()}';
//     } else {
//       timeZoneOffsetMString = timeZoneOffsetM.toString();
//     }
//
//     Dio dio = Dio();
//     dio.options.baseUrl = apiConfiguration.baseUrl;
//     dio.options.connectTimeout = apiConfiguration.connectionTimeout;
//     dio.options.receiveTimeout = apiConfiguration.receiveTimeout;
//     dio.interceptors.clear();
//     dio.interceptors.add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
//       options.headers['USER_UID'] = authInfo?.userInfo?.userUid;
//       options.headers['TOKEN'] = authInfo?.userInfo?.token;
//       options.headers['ACCESS_TOKEN'] = authInfo?.accessToken;
//       options.headers['TIME_ZONE'] = '$timeZoneOffsetHString:$timeZoneOffsetMString';
//       return handler.next(options);
//     }, onError: (error, handler) async {
//       if (error.response?.statusCode == 401) {
//         Dio refreshTokenDio = Dio();
//         refreshTokenDio.options.baseUrl = apiConfiguration.baseUrl;
//         refreshTokenDio.options.connectTimeout = apiConfiguration.connectionTimeout;
//         refreshTokenDio.options.receiveTimeout = apiConfiguration.receiveTimeout;
//         refreshTokenDio.options.headers['USER_UID'] = authInfo?.userInfo?.userUid;
//         refreshTokenDio.options.headers['TOKEN'] = authInfo?.userInfo?.token;
//         refreshTokenDio.options.headers['REFRESH_TOKEN'] = authInfo?.userInfo?.refreshToken;
//         refreshTokenDio.options.headers['ACCESS_TOKEN'] = authInfo?.accessToken;
//         refreshTokenDio.options.headers['ENC_REFRESH_TOKEN'] = authInfo?.encRefreshToken;
//         refreshTokenDio.options.headers['TIME_ZONE'] = '$timeZoneOffsetHString:$timeZoneOffsetMString';
//         refreshTokenDio.interceptors.clear();
//         refreshTokenDio.interceptors.add(QueuedInterceptorsWrapper(onError: (error, handler) async {
//           if (error.response?.statusCode == 401) {
//             await ref.read(authInfoProvider.notifier).updateAuthInfo(null);
//           }
//           return handler.next(error);
//         }));
//
//         final response = await refreshTokenDio.get('/mobile/token/refresh');
//         final newAuthInfo = AuthInfo.fromJson(response.data);
//         await ref.read(authInfoProvider.notifier).updateAuthInfo(newAuthInfo);
//         RequestOptions requestOptions = error.requestOptions;
//         requestOptions.headers['USER_UID'] = newAuthInfo.userInfo?.userUid;
//         requestOptions.headers['TOKEN'] = newAuthInfo.userInfo?.token;
//         requestOptions.headers['ACCESS_TOKEN'] = newAuthInfo.accessToken;
//         requestOptions.headers['TIME_ZONE'] = '$timeZoneOffsetHString:$timeZoneOffsetMString';
//         dio.interceptors.clear();
//         final retryResponse = await dio.request(
//           requestOptions.path,
//           options: Options(
//             method: requestOptions.method,
//             headers: requestOptions.headers
//           ),
//           data: requestOptions.data,
//           queryParameters: requestOptions.queryParameters
//         );
//
//         return handler.resolve(retryResponse);
//       } else {
//         return handler.next(error);
//       }
//     }));
//
//     return dio;
//   }
//
//   Future<Response> getData(String uri, {Map<String, dynamic>? param}) async {
//     try {
//       final dio = await generateDio();
//
//       if (param != null && param.isNotEmpty) {
//         return await dio.get(uri, queryParameters: param);
//       } else {
//         return await dio.get(uri);
//       }
//     } on DioError catch(e) {
//       if (e.type == DioErrorType.connectTimeout) {
//         throw ApiException('common.serverConnectFail'.tr());
//       } else {
//         if (e.response?.statusCode == 401) {
//           throw ApiException('common.authTokenExpired'.tr());
//         } else {
//           throw ApiException('common.serverInternalError'.tr());
//         }
//       }
//     }
//   }
//
//   Future<Response> getFileData(String uri, {FormData? param}) async {
//     try {
//       final dio = await generateDio();
//
//       if(param != null) {
//         return await dio.post(uri, data: param);
//       } else {
//         return await dio.post(uri);
//       }
//     } on DioError catch(e) {
//       if (e.type == DioErrorType.connectTimeout) {
//         throw ApiException('common.serverConnectFail'.tr());
//       } else {
//         if (e.response?.statusCode == 401) {
//           throw ApiException('common.authTokenExpired'.tr());
//         } else {
//           throw ApiException('common.serverInternalError'.tr());
//         }
//       }
//     }
//   }
//
//   Future<Response> downloadReportData(String uri, {FormData? param}) async {
//     try {
//       var option = Options(responseType: ResponseType.bytes);
//       final dio = await generateDio();
//
//       return await dio.post(uri, data: param, options: option);
//     } on DioError catch(e) {
//       if (e.type == DioErrorType.connectTimeout) {
//         throw ApiException('common.serverConnectFail'.tr());
//       } else {
//         if (e.response?.statusCode == 401) {
//           throw ApiException('common.authTokenExpired'.tr());
//         } else {
//           throw ApiException('common.serverInternalError'.tr());
//         }
//       }
//     }
//   }
// }