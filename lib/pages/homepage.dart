import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:prayer_time_app/CustomField/custom_field.dart';
import 'package:prayer_time_app/DataProvider/data_provider.dart';
import 'package:intl/intl.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    Box box=Hive.box("data");

    DateFormat dateFormat = DateFormat("EEEE,d MMMM ,y");

    final data=ref.watch(prayerDataProvider);

    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.blue.withOpacity(0.5),
          child: data.when(
              data: (data){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Prayer Times in Dhaka",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                    ),
                    Text(dateFormat.format(DateTime.now()),
                    style: TextStyle(
                      fontSize: 16
                    ),
                    ),
                    CustomField(fieldName: "Fajr", fieldValue: box.get("fajr")),
                    CustomField(fieldName: "Sunrise", fieldValue: box.get("Sunrise")),
                    CustomField(fieldName: "Dhuhr", fieldValue: box.get("Dhuhr")),
                    CustomField(fieldName: "Asr", fieldValue: box.get("Asr")),
                    CustomField(fieldName: "Maghrib", fieldValue: box.get("Maghrib")),
                    CustomField(fieldName: "Sunset", fieldValue: box.get("Sunset")),
                    CustomField(fieldName: "Isha", fieldValue: box.get("Isha")),
                  ],
                );
              },
              error: (error,s){
                print(error.toString());
              },
              loading: (){
            CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}


