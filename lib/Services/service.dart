import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_time_app/Model/models.dart';


class ApiServices{
  int currentMonth=DateTime.now().month;
  int currentYear=DateTime.now().year;
  String url="http://api.aladhan.com/v1/calendarByCity/2024/2?method=2&city=dhaka&country=Bangladesh";

  getData() async{
    http.Response response=await http.get(Uri.parse("http://api.aladhan.com/v1/calendarByCity/$currentYear/$currentMonth?method=2&city=dhaka&country=Bangladesh"));
    if(response.statusCode==200){
      int currentDate=DateTime.now().day;
      UserModel userModel=UserModel.fromJson(jsonDecode(response.body)['data'][currentDate]['timings']);
      return userModel;
    }
    else{
      print("error");
    }
  }
}

final dataProvider=Provider((ref) => ApiServices());