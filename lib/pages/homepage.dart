import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_time_app/CustomField/custom_field.dart';
import 'package:prayer_time_app/DataProvider/data_provider.dart';
import 'package:intl/intl.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
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
                    CustomField(fieldName: "Fajr", fieldValue: data.fajr),
                    CustomField(fieldName: "Sunrise", fieldValue: data.sunrise),
                    CustomField(fieldName: "Dhuhr", fieldValue: data.dhuhr),
                    CustomField(fieldName: "Asr", fieldValue: data.asr),
                    CustomField(fieldName: "Maghrib", fieldValue: data.maghrib),
                    CustomField(fieldName: "Sunset", fieldValue: data.sunset),
                    CustomField(fieldName: "Isha", fieldValue: data.isha),
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


