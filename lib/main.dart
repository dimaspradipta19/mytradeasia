import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mytradeasia/features/presentation/state_management/message_bloc/channel_list/channel_list_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/searates_bloc/searates_route/searates_route_bloc.dart';
import 'package:sendbird_chat_sdk/sendbird_chat_sdk.dart';
import 'package:mytradeasia/config/routes/routes.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/dhl_shipment_bloc/dhl_shipment_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/faq_bloc/faq_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/detail_product_bloc/detail_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_bloc.dart';
import 'package:mytradeasia/features/presentation/widgets/loading_overlay_widget.dart';
import 'package:mytradeasia/firebase_options.dart';
import 'package:mytradeasia/helper/injections_container.dart';
import 'package:mytradeasia/config/themes/theme.dart';

import 'features/presentation/state_management/industry_bloc/industry_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SendbirdChat.init(appId: 'DCD5F067-8067-49BF-954E-CEB3631B555F');

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
  bool _connection = true;
  checkConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      _connection = true;
      return;
    } else {
      _connection = false;
    }
    setState(() {});
  }

  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injections<AuthBloc>(),
        ),
        BlocProvider(create: (_) => injections<CartBloc>()),
        BlocProvider(
          create: (_) => injections<ListProductBloc>(),
        ),
        BlocProvider(
          create: (_) => injections<IndustryBloc>(),
        ),
        BlocProvider(
          create: (_) => injections<SearchProductBloc>(),
        ),
        BlocProvider(create: (_) => injections<TopProductBloc>()),
        BlocProvider(
          create: (_) => injections<FaqBloc>(),
        ),
        BlocProvider(
          create: (_) => injections<DhlShipmentBloc>(),
        ),
        BlocProvider(create: (_) => injections<DetailProductBloc>()),
        BlocProvider(create: (_) => injections<SalesforceLoginBloc>()),
        BlocProvider(create: (_) => injections<SalesforceDataBloc>()),
        BlocProvider(create: (_) => injections<SalesforceDetailBloc>()),
        BlocProvider(create: (_) => injections<ChannelListBloc>()),
        BlocProvider(create: (_) => injections<SearatesRouteBloc>())
      ],
      child: StreamBuilder<InternetConnectionStatus>(
        initialData: InternetConnectionStatus.connected,
        stream: InternetConnectionChecker().onStatusChange,
        builder: (context, snapshot) {
          return MaterialApp.router(
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
            builder: (context, child) {
              checkConnection();
              return Stack(
                children: [
                  child!,
                  _connection ? const SizedBox() : const LoadingOverlay(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
