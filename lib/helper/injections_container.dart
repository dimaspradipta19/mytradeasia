import 'package:get_it/get_it.dart';
import 'package:mytradeasia/features/data/data_sources/firebase/auth_user_firebase.dart';
import 'package:mytradeasia/features/data/data_sources/firebase/cart_firebase.dart';
import 'package:mytradeasia/features/data/data_sources/remote/all_industry_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/detail_product_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/dhl_shipment_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/faq_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/list_product_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/rfq_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_data_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_detail_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/sales_force_login_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/search_product_service.dart';
import 'package:mytradeasia/features/data/data_sources/remote/top_products_service.dart';
import 'package:mytradeasia/features/data/repository/cart_repository_impl.dart';
import 'package:mytradeasia/features/data/repository/detail_product_repository.dart';
import 'package:mytradeasia/features/data/repository/dhl_shipment_repository.dart';
import 'package:mytradeasia/features/data/repository/faq_repository.dart';
import 'package:mytradeasia/features/data/repository/industry_repository.dart';
import 'package:mytradeasia/features/data/repository/list_product_repository.dart';
import 'package:mytradeasia/features/data/repository/rfq_repository_impl.dart';
import 'package:mytradeasia/features/data/repository/sales_force_data_repository.dart';
import 'package:mytradeasia/features/data/repository/sales_force_detail_repository.dart';
import 'package:mytradeasia/features/data/repository/sales_force_login_repository.dart';
import 'package:mytradeasia/features/data/repository/search_product_repository.dart';
import 'package:mytradeasia/features/data/repository/top_product_repository.dart';
import 'package:mytradeasia/features/data/repository/user_repository_impl.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';
import 'package:mytradeasia/features/domain/repository/detail_product_repository.dart';
import 'package:mytradeasia/features/domain/repository/dhl_shipment_repository.dart';
import 'package:mytradeasia/features/domain/repository/faq_repository.dart';
import 'package:mytradeasia/features/domain/repository/industry_repository.dart';
import 'package:mytradeasia/features/domain/repository/list_product_repository.dart';
import 'package:mytradeasia/features/domain/repository/rfq_repository.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_data_repository.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_detail_repository.dart';
import 'package:mytradeasia/features/domain/repository/sales_force_login_repository.dart';
import 'package:mytradeasia/features/domain/repository/search_product_repository.dart';
import 'package:mytradeasia/features/domain/repository/top_product_repository.dart';
import 'package:mytradeasia/features/domain/repository/user_repository.dart';
import 'package:mytradeasia/features/domain/usecases/cart_usecases/add_cart.dart';
import 'package:mytradeasia/features/domain/usecases/cart_usecases/get_cart.dart';
import 'package:mytradeasia/features/domain/usecases/detail_product_usecases/get_detail_product.dart';
import 'package:mytradeasia/features/domain/usecases/dhl_shipment_usecases/get_dhl_shipment.dart';
import 'package:mytradeasia/features/domain/usecases/faq_usecases/get_faq_data.dart';
import 'package:mytradeasia/features/domain/usecases/industry_usecases/get_industry.dart';
import 'package:mytradeasia/features/domain/usecases/list_product_usecases/get_list_product.dart';
import 'package:mytradeasia/features/domain/usecases/rfq_usecases/submit_rfq.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_data_usecases/get_sales_force_data.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_detail_usecases/get_sales_force_detail.dart';
import 'package:mytradeasia/features/domain/usecases/sales_force_login_usecases/get_sales_force_login.dart';
import 'package:mytradeasia/features/domain/usecases/search_product_usecases/get_search_product.dart';
import 'package:mytradeasia/features/domain/usecases/top_product_usecases/get_top_product.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/login.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/register.dart';
import 'package:mytradeasia/features/presentation/state_management/auth_bloc/auth_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/dhl_shipment_bloc/dhl_shipment_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/industry_bloc/industry_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/faq_bloc/faq_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/detail_product_bloc/detail_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/list_product/list_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/product_bloc/search_product/search_product_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_data/salesforce_data_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_detail/salesforce_detail_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_bloc.dart';

final injections = GetIt.instance;

Future<void> initializeDependencies() async {
  //Services Dependencies
  injections.registerSingleton<AllIndustryService>(AllIndustryService());
  injections.registerSingleton<DetailProductService>(DetailProductService());
  injections.registerSingleton<DhlShipmentService>(DhlShipmentService());
  injections.registerSingleton<FaqService>(FaqService());
  injections.registerSingleton<ListProductService>(ListProductService());
  injections.registerSingleton<SalesforceDataService>(SalesforceDataService());
  injections
      .registerSingleton<SalesforceDetailService>(SalesforceDetailService());
  injections
      .registerSingleton<SalesforceLoginService>(SalesforceLoginService());
  injections.registerSingleton<SearchProductService>(SearchProductService());
  injections.registerSingleton<TopProductsService>(TopProductsService());
  injections.registerSingleton<AuthUserFirebase>(AuthUserFirebase());
  injections.registerSingleton<RfqService>(RfqService());
  injections.registerSingleton<CartFirebase>(CartFirebase());

  //Repositories Dependencies
  injections.registerSingleton<DetailProductRepository>(
      DetailProductRepositoryImpl(injections()));
  injections.registerSingleton<DhlShipmentRepo>(
      DhlShipmentRepositoryImpl(injections()));
  injections.registerSingleton<FaqRepository>(FaqRepositoryImpl(injections()));
  injections.registerSingleton<IndustryRepository>(
      IndustryRepositoryImpl(injections()));
  injections.registerSingleton<ListProductRepository>(
      ListProductRepositoryImpl(injections()));
  injections.registerSingleton<SalesForceDataRepository>(
      SalesforceDataRepositoryImpl(injections()));
  injections.registerSingleton<SalesForceDetailRepo>(
      SalesforceDetailRepositoryImpl(injections()));
  injections.registerSingleton<SalesforceLoginRepo>(
      SalesforceLoginRepositoryImpl(injections()));
  injections.registerSingleton<SearchProductRepo>(
      SearchProductRepositoryImpl(injections()));
  injections.registerSingleton<TopProductRepository>(
      TopProductRepositoryImpl(injections()));
  injections
      .registerSingleton<UserRepository>(UserRepositoryImpl(injections()));
  injections.registerSingleton<RfqRepository>(RfqRepositoryImpl(injections()));
  injections
      .registerSingleton<CartRepository>(CartRepositoryImpl(injections()));

  //UseCases Dependencies
  injections
      .registerSingleton<GetDetailProduct>(GetDetailProduct(injections()));
  injections.registerSingleton<GetDhlShipment>(GetDhlShipment(injections()));
  injections.registerSingleton<GetFaqData>(GetFaqData(injections()));
  injections.registerSingleton<GetIndustryData>(GetIndustryData(injections()));
  injections.registerSingleton<GetListProduct>(GetListProduct(injections()));
  injections
      .registerSingleton<GetSalesForceData>(GetSalesForceData(injections()));
  injections.registerSingleton<GetSalesforceDetail>(
      GetSalesforceDetail(injections()));
  injections
      .registerSingleton<GetSalesforceLogin>(GetSalesforceLogin(injections()));
  injections
      .registerSingleton<GetSearchProduct>(GetSearchProduct(injections()));
  injections.registerSingleton<GetTopProductUseCase>(
      GetTopProductUseCase(injections()));
  injections.registerSingleton<RegisterUser>(RegisterUser(injections()));
  injections.registerSingleton<LoginUser>(LoginUser(injections()));
  injections
      .registerSingleton<SubmitRfqUseCase>(SubmitRfqUseCase(injections()));
  injections.registerSingleton<GetCart>(GetCart(injections()));
  injections.registerSingleton<AddCart>(AddCart(injections()));

  //Bloc
  injections
      .registerFactory<ListProductBloc>(() => ListProductBloc(injections()));
  injections.registerFactory<IndustryBloc>(() => IndustryBloc(injections()));
  injections.registerFactory<SearchProductBloc>(
      () => SearchProductBloc(injections()));

  injections.registerFactory<FaqBloc>(() => FaqBloc(injections()));
  injections
      .registerFactory<TopProductBloc>(() => TopProductBloc(injections()));
  injections
      .registerFactory<DhlShipmentBloc>(() => DhlShipmentBloc(injections()));
  injections.registerFactory<DetailProductBloc>(
      () => DetailProductBloc(injections()));
  injections.registerFactory<SalesforceLoginBloc>(
      () => SalesforceLoginBloc(injections()));
  injections.registerFactory<SalesforceDataBloc>(
      () => SalesforceDataBloc(injections()));
  injections.registerFactory<SalesforceDetailBloc>(
      () => SalesforceDetailBloc(injections()));
  injections
      .registerFactory<AuthBloc>(() => AuthBloc(injections(), injections()));
  injections
      .registerFactory<CartBloc>(() => CartBloc(injections(), injections()));
}
