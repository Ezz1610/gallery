import 'package:dio/dio.dart';
import 'package:gellary/shared/api_urls.dart';
/*
* dio?.get(url,queryParameters ):this function get data from server but need to 2 parameters (url and queryParameters)
* getData(): when call this function will get data from server but this function need to take 2 parameters (url and queryParameters)
* url : this from type string
* queryParameters: this from type map because it write by key=value
* make all of [ dio,inti(),getData() ] from type static = عند استدعائه DioHelper علشان اعرف أءكسز على الدوال و المتغيرات الي داخل كلاس
* */
class DioHelper {
  //make object from type Dio
  static Dio ?dio;
  //create the object= define the object
  static inti(){
    dio=Dio(
      BaseOptions(
          baseUrl:ApiUrls.baseUrl,
          receiveDataWhenStatusError:true,

      ),
    );
  }


  static Future<Response>?loginRequest({
  required Map<String,dynamic> data,
  Map<String,dynamic> ?query,
    String ?token,
})async{

    Response? response;
    try{
      response=await dio?.post(
        ApiUrls.loginPath,
        data: data,
        queryParameters: query,
      );
      print("response from dio : $response");

      return  response!;
    }catch(error){
      print("error is : ${error}");
    }
    return  response!;


  }
}