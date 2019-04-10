//导入网络请求相关的包
import 'dart:convert';
import 'dart:io';
import 'package:flutter_modulew/net/model/bbq_person_model.dart';
import 'package:http/http.dart' as http;


import 'package:dio/dio.dart';

class HttpUse  {

  ///http请求
  void pullNet()  {
    //get 请求
    http.get("http://www.wanandroid.com/project/list/1/json?cid=1")
        .then((http.Response response) {
      var convertDataToJson = json.decode(response.body);
      convertDataToJson = convertDataToJson["data"]["datas"];
      //打印请求的结果
      print(convertDataToJson);
    });
  }

  ///httpclient请求
  //创建 client.
  //构造 Uri.
  //发起请求, 等待请求，同时您也可以配置请求headers、 body。
  //关闭请求, 等待响应.
  //解码响应的内容.
  static Future<BbqPerson> httpClient() async {
    BbqPerson bbqPerson;
    var responseBody;
    var httpClient = new HttpClient();//该 client 支持常用的HTTP操作, such as GET, POST, PUT, DELETE.
    //构建uri并发起请求
    var url1="http://bbqzs.shandw.com/playercombat?uid=1837005618&playerId=BN0100018&token=c827365b6c8f9255da5730ca3a5b82ea&fl=10275&sec=1554104007110&page=0&channel=10275&countrycode=cn&pageSize=20&killNum=0";
    var url2="http://bbqzs.shandw.com/playercombat?uid=1837005618&playerId=BN0097716&token=7ae34df1dbad71523d9a334a5f1a03d5&fl=10275&sec=1554114056887&page=0&channel=10275&countrycode=cn&pageSize=20&killNum=0";
    var request = await httpClient.getUrl(
        Uri.parse(url2));
    var response = await request.close();//关闭请求等待响应
    //判断是否请求成功
    if (response.statusCode == HttpStatus.ok) {
       print("success");
      //拿到请求的数据
      responseBody = await response.transform(utf8.decoder).join();
      final jsonResponse = json.decode(responseBody);//解码我们得到的 json 字符串
       bbqPerson = new BbqPerson.fromJson(jsonResponse);//现在我们通过调用 Student.fromJson 方法反序列化解码的 json 响应
      //解析json，拿到对应的jsonArray数据
//      var convertDataToJson = jsonDecode(responseBody)["data"]["datas"];
    } else {
      print("error");
    }
    return bbqPerson;
  }

  ///运用第三方库进行网络请求
  void getHttp() async {
    try {
      Response response = await Dio().get("http://www.google.com");
      print(response);
    } catch (e) {
      print(e);
    }
  }


}
