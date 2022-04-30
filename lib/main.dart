import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/presentation/bottom_nav_bar/bottom_nav_bar.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.transparent,
  ));
  runApp(ProviderScope(child: MyApp()));
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  late StreamSubscription<bool> keyboardSubscription;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (context){
                  return  MaterialApp(
                      locale:  const Locale('en', 'US'),
                      debugShowCheckedModeBanner: false,
                      supportedLocales:const[
                        Locale('ar', ''),
                        Locale('en', 'US'),
                      ],
                      home: BottomNavigationBarScreen()
                  );
                }
            );
          },
        );
      },
    );
  }
}