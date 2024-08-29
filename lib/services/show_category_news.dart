import 'dart:convert';
import 'package:techtime/models/show_category.dart';
// import 'package:techtime/models/slider_model.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews{

  List<ShowCategoryModel> categories  = [];


  Future<void> getCategoriesNews(String category)async{

    String url = "https://newsapi.org/v2/everything?q=apple&from=2024-08-17&to=2024-08-17&sortBy=popularity&apiKey=3bcfb6a39b1b4836aeef62c562ac1e7b";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element['description']!=null){
          ShowCategoryModel categoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],

          );

          categories.add(categoryModel);
        }

      });



    }
  }

}