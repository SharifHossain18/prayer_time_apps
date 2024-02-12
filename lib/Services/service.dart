import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:prayer_time_app/Model/models.dart';

Box box=Hive.box("data");
class ApiServices{
  
  int currentMonth=DateTime.now().month;
  int currentYear=DateTime.now().year;
  String url="http://api.aladhan.com/v1/calendarByCity/2024/2?method=2&city=dhaka&country=Bangladesh";

  // getData() async{
  //   http.Response response=await http.get(Uri.parse("http://api.aladhan.com/v1/calendarByCity/$currentYear/$currentMonth?method=2&city=dhaka&country=Bangladesh"));
  //   if(response.statusCode==200){
  //     int currentDate=DateTime.now().day;
  //     UserModel userModel=UserModel.fromJson(jsonDecode(response.body)['data'][currentDate]['timings']);
  //     putData(userModel);
  //
  //     return userModel;
  //   }
  //   else{
  //     print("error");
  //   }
  // }

  getData() async{
    try{
      http.Response response=await http.get(Uri.parse("http://api.aladhan.com/v1/calendarByCity/$currentYear/$currentMonth?method=2&city=dhaka&country=Bangladesh"));
      if(response.statusCode==200){
        int currentDate=DateTime.now().day;
        UserModel userModel=UserModel.fromJson(jsonDecode(response.body)['data'][currentDate]['timings']);
        putData(userModel);

        return userModel;
      }
      else{
        print("error");
      }
    }
    catch(e){
      print(e.toString());
    }

  }


}


Future putData(data) async{
  await box.clear();
  box.put("fajr", data.fajr);
  box.put("Sunrise", data.sunrise);
  box.put("Dhuhr", data.dhuhr);
  box.put("Asr", data.asr);
  box.put("Maghrib", data.maghrib);
  box.put("Sunset", data.sunset);
  box.put("Isha", data.isha);

}

final dataProvider=Provider((ref) => ApiServices());