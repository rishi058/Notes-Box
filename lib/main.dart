import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes_box/screens/about_screen.dart';
import 'package:notes_box/screens/add_note_screen.dart';
import 'package:notes_box/screens/edit_screen.dart';
import 'package:notes_box/screens/home_screen.dart';
import 'package:notes_box/screens/intro_screens/login_screen.dart';
import 'package:notes_box/screens/search_screen.dart';
import 'package:notes_box/styling/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:notes_box/screens/intro_screens/splash_screen.dart';
import 'package:get/get.dart';

import 'Sizer/sizer.dart';
import 'constants.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            authDomain: Constants.authDomain,
            projectId: Constants.projectId,
            storageBucket: Constants.storageBucket,
            messagingSenderId: Constants.messagingSenderId,
            appId: Constants.appId,
            measurementId: Constants.measurementId
        ),);
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

double getWidth(BuildContext ctx){
  var width = MediaQuery.of(ctx).size.height;
  var currOr = MediaQuery.of(ctx).orientation;
  var width2 = MediaQuery.of(ctx).size.width;
  if(currOr==Orientation.landscape && width<480){  // for phone orientation
    return width2/1.5;
  }
  else{
    return 500;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, child!),
          maxWidth: getWidth(context),
          minWidth: MediaQuery.of(context).size.width,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.autoScale(350, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(450, name: MOBILE),
          ],
          background: Container(color: Colors.black)),
      home: const MyApp2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
        context: context,
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: CustomColors().black,
                brightness: Brightness.dark,
                useMaterial3: true,
              pageTransitionsTheme: const PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                },
              ),
            ),

            home: const SplashScreen(),
            routes: {
              'login-screen': (context) => const LoginScreen(),
              'home-screen': (context) => const HomeScreen(),
              'add-screen': (context) => const AddNote(),
              'edit-screen': (context) => const EditNote(),
              'about-us-screen': (context) => const AboutUs(),
              'search-screen': (context) => const SearchPage(),
            },
          );}
    );
  }
}

