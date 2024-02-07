
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prayer_time_app/Services/service.dart';

final prayerDataProvider=FutureProvider((ref){
  return ref.watch(dataProvider).getData();
});