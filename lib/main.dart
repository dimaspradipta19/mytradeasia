import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mytradeasia/firebase_options.dart';
import 'package:mytradeasia/modelview/provider/all_industry_provider.dart';
import 'package:mytradeasia/modelview/provider/auth_provider.dart';
import 'package:mytradeasia/modelview/provider/list_product_provider.dart';
import 'package:mytradeasia/modelview/provider/loading_provider.dart';
import 'package:mytradeasia/modelview/provider/obsecure_provider.dart';
import 'package:mytradeasia/modelview/provider/search_product_provider.dart';
import 'package:mytradeasia/modelview/provider/top_products_provider.dart';
import 'package:mytradeasia/utils/theme.dart';
import 'package:mytradeasia/view/menu/other/splash_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ObscureTextProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TopProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AllIndustryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => TopProductsProvider(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyTradeasia',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: whiteColor),
          primaryColor: whiteColor,
          bottomNavigationBarTheme:
              const BottomNavigationBarThemeData(backgroundColor: whiteColor),
          scaffoldBackgroundColor: whiteColor,
          fontFamily: "Poppins",
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
