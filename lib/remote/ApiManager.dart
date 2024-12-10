import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/ArticlesRespons/ArticlesRespons.dart';
import 'package:newsapp/model/SourcesRespons/SourcesRespons.dart';
import 'constants.dart';

class ApiManager{


  static Future<SourcesRespons?> getSources(String category)async{
    try{
      Uri url = Uri.https(baseUrl,sourcesEndPoint,{
        "category":category,
        "apiKey": apiKey
      });
      var response = await http.get(url);
      Map<String, dynamic> json = jsonDecode(response.body);
      SourcesRespons sourcesRespons = SourcesRespons.fromJson(json);
      return sourcesRespons;
    }catch(error){
      print(error.toString());
    }
  }

  static Future<ArticlesRespons?>getArticles(String sourceId)async{
    try{
      Uri url = Uri.https(baseUrl,articlesEndpoint,{
        "apiKey":apiKey,
        "sources":sourceId
      });
      var response = await http.get(url);
       Map<String, dynamic> json = jsonDecode(response.body);
       var articlesResponse = ArticlesRespons.fromJson(json);
       return articlesResponse;
    }catch(error){
      print(error.toString());
    }
  }

  static Future<ArticlesRespons?>getArticlesSearch(String query)async{

      Uri url = Uri.https(baseUrl,articlesEndpoint,{
        "apiKey":apiKey,
        "q":query,
      });
      var response = await http.get(url);
      if(response.statusCode>=200&& response.statusCode<=300){
        Map<String, dynamic> json = jsonDecode(response.body) as Map<String,dynamic>;
        return ArticlesRespons.fromJson(json);
      }
      else{
        throw Exception('Error ${response.statusCode}');
      }

      var articlesResponse = ArticlesRespons.fromJson(json);
      return articlesResponse;

  }
}