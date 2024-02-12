import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prayer_time_app/Routers/routing.dart';

void main() async{
  await Hive.initFlutter();
  var dir=  await getApplicationDocumentsDirectory();
   Hive.init(dir.path);
  await Hive.openBox("data");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final router=ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      debugShowCheckedModeBanner: false,

    );
  }
}

