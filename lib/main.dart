import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mytradeasia/config/routes/routes.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/faq_bloc/faq_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_bloc.dart';
import 'package:mytradeasia/firebase_options.dart';
import 'package:mytradeasia/helper/injections_container.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:provider/provider.dart';

import 'features/presentation/state_management/industry_bloc/industry_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (_) => injections<ListProductBloc>(),
        ),
        BlocProvider(
          create: (_) => injections<IndustryBloc>(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SearchProductProvider(),
        // ),
        BlocProvider(create: (_) => injections<TopProductBloc>()),
        BlocProvider(
          create: (_) => injections<FaqBloc>(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => LoadingProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => ObscureTextProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => TopProductsProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => AllIndustryProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => AuthProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => FaqProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) =>
        //       DetailProductProvider(service: DetailProductService()),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => SeeMoreProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => DhlShipmentProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => SalesforceLoginProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => SalesforceDataProvider(),
        // ),
        // ChangeNotifierProvider(
        //   create: (context) => SalesforceDetailProvider(),
        // ),
      ],
      child: StreamProvider<InternetConnectionStatus>(
          initialData: InternetConnectionStatus.connected,
          create: ((_) => InternetConnectionChecker().onStatusChange),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'MyTradeasia',
            theme: ThemeData(
              appBarTheme: const AppBarTheme(color: whiteColor),
              primaryColor: whiteColor,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: whiteColor),
              scaffoldBackgroundColor: whiteColor,
              fontFamily: "Poppins",
            ),
            routerConfig: Routes().router,
          )),
    );
  }
}
