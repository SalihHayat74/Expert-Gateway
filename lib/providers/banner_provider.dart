



import 'dart:convert';

import 'package:expert_gateway/models/banner_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class BannerProvider extends ChangeNotifier{
  List<BannerModel> banners=[];

  getBanners()async{

    String url="https://expertgateway-staging.findanexpert.net/homepage_svc/pb/Sections/getAllSectionsDetails?countryId=1";

    http.Response response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
      banners.clear();
      Map<String,dynamic> data=jsonDecode(response.body);
      for(int i=0;i<data["result"]["sectionsDetails"].length;i++){
        BannerModel banner=BannerModel.fromJson(data["result"]["sectionsDetails"][i]);
        banners.add(banner);
      }
      notifyListeners();
    }
  }


}