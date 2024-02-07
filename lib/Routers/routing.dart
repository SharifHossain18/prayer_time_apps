
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:prayer_time_app/pages/get_started.dart';
import '../pages/homepage.dart';

final goRouterProvider=Provider((ref) {
  return GoRouter(
      routes: [
        GoRoute(
            path: '/',
            builder: (context,state)=>GetStarted(),

        ),
        GoRoute(
          path: '/home',
          builder: (context,state)=>HomePage(),

        ),
      ]);

});