import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Blocs/Internet_Block/internet_main.dart';
import 'package:flutterbloc/Views/HomeScreen.dart';
import 'package:flutterbloc/google_ads/custom_ad.dart';
import 'package:firebase_core/firebase_core.dart';
import 'AnimationScreen.dart';
import 'package:go_router/go_router.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC5npLq0BGUwjJVXAdpVZNaWD9l9f5VH18",
        appId: '1:892619959901:android:72d6dfa3e6673152c967b4',
        messagingSenderId: '892619959901', projectId: 'againfirebase-8458c',

      )
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'animation',
            builder: (BuildContext context, GoRouterState state) {
              return const AnimationScreen();
            },
          ),
        ],
      ),
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return InternetBloc();
      },
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
        // home:Scaffold(
        //   body:BannerShowScreen() ,
        // )
      ),
    );
  }
}

class BannerShowScreen extends StatelessWidget {
  const BannerShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const BannerAdClass());
  }
}
