import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import '../../features/presentation/pages/auth/biodata/biodata_screen.dart';
import '../../features/presentation/pages/auth/choose_role/role_user_screen.dart';
import '../../features/presentation/pages/auth/login/forgot_password/forgot_password_screen.dart';
import '../../features/presentation/pages/auth/login/forgot_password/reset_password_screen.dart';
import '../../features/presentation/pages/auth/login/login_screen.dart';
import '../../features/presentation/pages/auth/register/register_screen.dart';
import '../../features/presentation/pages/menu/history/history_screen.dart';
import '../../features/presentation/pages/menu/history/order/order_detail_screen.dart';
import '../../features/presentation/pages/menu/history/tracking_document/tracking_document_detail.dart';
import '../../features/presentation/pages/menu/history/tracking_document/tracking_document_screen.dart';
import '../../features/presentation/pages/menu/history/tracking_shipment/detailed_shipment_products_screen.dart';
import '../../features/presentation/pages/menu/history/tracking_shipment/tracking_shipment_detail_screen.dart';
import '../../features/presentation/pages/menu/history/tracking_shipment/tracking_shipment_screen.dart';
import '../../features/presentation/pages/menu/home/all_products/industry/all_industry_screen.dart';
import '../../features/presentation/pages/menu/home/all_products/products/all_products_screen.dart';
import '../../features/presentation/pages/menu/home/all_products/products/products_detail_screen.dart';
import '../../features/presentation/pages/menu/home/all_products/products/rfq_submitted_screen.dart';
import '../../features/presentation/pages/menu/home/all_products/request_quotation_screen.dart';
import '../../features/presentation/pages/menu/home/cart/cart_screen.dart';
import '../../features/presentation/pages/menu/home/home_screen.dart';
import '../../features/presentation/pages/menu/home/notification/notification_screen.dart';
import '../../features/presentation/pages/menu/home/search/search_product_screen.dart';
import '../../features/presentation/pages/menu/home/top_products/top_products_screen.dart';
import '../../features/presentation/pages/menu/messages/messages_detail_screen.dart';
import '../../features/presentation/pages/menu/messages/messages_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/mytradeasia_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/change_password/change_password_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/contact_us/contact_us_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/faq/faq_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/languages/language_apps_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/personal_data/change_email_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/personal_data/email_change_otp.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/personal_data/personal_data_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/quotations/my_quotations_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/quotations/quotation_detail.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/settings/notification_screen.dart';
import '../../features/presentation/pages/menu/mytradeasia/submenu/settings/settings_screen.dart';
import '../../features/presentation/pages/menu/other/navigation_bar.dart';
import '../../features/presentation/pages/menu/other/splash_page.dart';

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

class Routes {
  GoRouter router =
      GoRouter(initialLocation: "/", debugLogDiagnostics: false, routes: [
    GoRoute(
        path: "/",
        builder: (context, state) => const SplashScreen(),
        redirect: (context, state) => '/'),
    ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) =>
            NavigationBarWidget(
              child: child,
            ),
        routes: [
          GoRoute(
              path: "/home",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const HomeScreen(), key: state.pageKey),
              routes: [
                GoRoute(
                    path: "notification",
                    builder: (context, state) => const NotificationScreen()),
                GoRoute(
                    path: "search",
                    builder: (context, state) => const SearchScreen()),
                GoRoute(
                  path: "request_quotation",
                  builder: (context, state) {
                    RequestQuotationParameter param =
                        state.extra as RequestQuotationParameter;
                    return RequestQuotationScreen(
                      products: param.products,
                    );
                  },
                ),
                GoRoute(
                    path: 'submitted_rfq',
                    name: 'submitted_rfq',
                    builder: (context, state) => const SubmittedRFQScreen()),
                GoRoute(
                    path: "all_products",
                    builder: (context, state) => const AllProductsScreen(),
                    routes: [
                      GoRoute(
                          path: "product/:url",
                          name: 'product',
                          builder: (context, state) {
                            return ProductsDetailScreen(
                                urlProduct: state.pathParameters['url']!);
                          })
                    ]),
                GoRoute(
                  path: "top_products",
                  builder: (context, state) => const TopProductsScreen(),
                ),
                GoRoute(
                    path: "all_industry",
                    builder: (context, state) => const AllIndustryScreen()),
              ]),
          GoRoute(
              path: "/messages",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const MessageScreen(), key: state.pageKey),
              routes: [
                GoRoute(
                    path: "detail",
                    name: "message",
                    builder: (context, state) {
                      MessageDetailParameter param =
                          state.extra as MessageDetailParameter;
                      return MessagesDetailScreen(
                          otherUserId: param.otherUserId,
                          currentUserId: param.currentUserId,
                          chatId: param.chatId);
                    })
              ]),
          GoRoute(
              path: "/history",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const HistoryScreen(), key: state.pageKey),
              routes: [
                GoRoute(
                    path: "order",
                    builder: (context, state) {
                      return const OrderDetailScreen();
                    }),
                GoRoute(
                    path: "tracking_document",
                    builder: (context, state) => const TrackingDocumentScreen(),
                    routes: [
                      GoRoute(
                          path: "detail",
                          name: "detail_tracking_document",
                          builder: (context, state) {
                            TrackingDocumentParameter param =
                                state.extra as TrackingDocumentParameter;
                            return TrackingDocumentDetail(
                                product: param.product,
                                indexProducts: param.indexProducts);
                          })
                    ]),
                GoRoute(
                    path: "tracking_shipment",
                    builder: (context, state) => const TrackingShipmentScreen(),
                    routes: [
                      GoRoute(
                          path: "detail",
                          name: "detail_tracking_shipment",
                          builder: (context, state) {
                            TrackingShipmentParameter param =
                                state.extra as TrackingShipmentParameter;
                            return TrackingShipmentDetailScreen(
                                product: param.product,
                                indexProducts: param.indexProducts);
                          },
                          routes: [
                            GoRoute(
                                path: "shipment_product",
                                name: "shipment_product",
                                builder: (context, state) {
                                  return const DetailedShipmentProductsScreen();
                                })
                          ])
                    ]),
              ]),
          GoRoute(
              path: "/mytradeasia",
              pageBuilder: (context, state) => NoTransitionPage(
                  child: const MyTradeAsiaScreen(), key: state.pageKey),
              routes: [
                GoRoute(
                    path: "personal_data",
                    builder: (context, state) => const PersonalDataScreen(),
                    routes: [
                      GoRoute(
                          path: "change_email",
                          builder: (context, state) =>
                              const ChangeEmailScreen(),
                          routes: [
                            GoRoute(
                                path: "otp_email",
                                builder: (context, state) =>
                                    const EmailChangeOtpScreen())
                          ])
                    ]),
                GoRoute(
                    path: "change_password",
                    builder: (context, state) => const ChangePasswordScreen()),
                GoRoute(
                    path: "settings",
                    builder: (context, state) => const SettingsScreen(),
                    routes: [
                      GoRoute(
                          path: "notification_menu",
                          builder: (context, state) => const NotificationMenu())
                    ]),
                GoRoute(
                  path: "cart",
                  builder: (context, state) => const CartScreen(),
                ),
                GoRoute(
                    path: "quotations",
                    builder: (context, state) => const QuotationsScreen(),
                    routes: [
                      GoRoute(
                          path: "detail_quotation",
                          builder: (context, state) {
                            QuotationDetailParameter param =
                                state.extra as QuotationDetailParameter;
                            return QuotationDetailScreen(
                              status: param.status,
                              isSales: param.isSales,
                            );
                          }),
                    ]),
                GoRoute(
                    path: "sales_quotations",
                    builder: (context, state) => const SalesQuotationsScreen(),
                    routes: [
                      GoRoute(
                          path: "detail_quotation",
                          builder: (context, state) {
                            QuotationDetailParameter param =
                                state.extra as QuotationDetailParameter;
                            return QuotationDetailScreen(
                              status: param.status,
                              isSales: param.isSales,
                            );
                          }),
                    ]),
                GoRoute(
                    path: "language",
                    builder: (context, state) => const LanguageAppsScreen()),
                GoRoute(
                    path: "contact_us",
                    builder: (context, state) => const ContactUsScreen()),
                GoRoute(
                    path: "faq", builder: (context, state) => const FaqScreen())
              ])
        ]),
    GoRoute(
        path: "/auth",
        name: "choose_role",
        builder: (context, state) => const RoleUserScreen(),
        routes: [
          GoRoute(
              path: "login",
              builder: (context, state) => const LoginScreen(),
              routes: [
                GoRoute(
                    path: "forgot_password",
                    builder: (context, state) => const ForgotPasswordScreen()),
                // TODO : add email parameter (reset_password/:email) that will be passed to ResetPasswordScreen(email : state.pathParameters['email])
                GoRoute(
                    path: "reset_password",
                    builder: (context, state) => const ResetPasswordScreen())
              ]),
          GoRoute(
              path: "register",
              builder: (context, state) => const RegisterScreen(),
              routes: [
                GoRoute(
                    path: "biodata",
                    builder: (context, state) {
                      BiodataParameter param = state.extra as BiodataParameter;

                      return BiodataScreen(
                        email: param.email,
                        phone: param.phone,
                      );
                    })
              ]),
        ]),
  ]);
}
