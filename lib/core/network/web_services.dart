// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';

// import '../../features/home/data/models/top_speakers_model.dart';
// import '../constants.dart';
// import 'network_base_model.dart';

// part 'web_services.g.dart';

// @RestApi(baseUrl: baseAPIURL)
// abstract class WebServices {
//   factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

//   @GET("")
//   Future<NetworkBaseModel<List<TopSpeakersModel>>> getTopSpeakers({
//     @Query("op") String op = "speakers",
//     @Query("listUrl") String listUrl = "/Admin/Lists/Speakers",
//     @Query("viewName") String viewName = "Home",
//   });
  
// }
