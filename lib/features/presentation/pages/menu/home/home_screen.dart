import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/routes/parameters.dart';
import 'package:mytradeasia/features/domain/entities/product_entities/product_to_rfq_entity.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/add_recently_seen.dart';
import 'package:mytradeasia/features/domain/usecases/user_usecases/get_user_snapshot.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_event.dart';
import 'package:mytradeasia/features/presentation/state_management/salesforce_bloc/salesforce_login/salesforce_login_state.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_event.dart';
import 'package:mytradeasia/features/presentation/state_management/top_products_bloc/top_products_state.dart';
import 'package:mytradeasia/features/presentation/widgets/add_to_cart_button.dart';
import 'package:mytradeasia/features/presentation/widgets/cart_button.dart';
import 'package:mytradeasia/helper/injections_container.dart';
import 'package:mytradeasia/utils/sales_force_screen.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/old_file_tobedeleted/view/menu/history/tracking_document/tracking_document_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetUserSnapshot _getUserSnapshot = injections<GetUserSnapshot>();
  final AddRecentlySeen _addRecentlySeen = injections<AddRecentlySeen>();
  final String url = "https://chemtradea.chemtradeasia.com/";
  final bool showAll = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TopProductBloc>(context).add(const GetTopProduct());

      BlocProvider.of<SalesforceLoginBloc>(context)
          .add(const LoginSalesforce());

      BlocProvider.of<CartBloc>(context).add(const GetCartItems());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<TopProductBloc>(context)
                  .add(const GetTopProduct());
            },
            color: primaryColor1,
            child: SingleChildScrollView(
              child: StreamBuilder(
                  stream: _getUserSnapshot.call(),
                  builder: (context, AsyncSnapshot streamSnapshot) {
                    if (streamSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator.adaptive(
                        backgroundColor: primaryColor1,
                      );
                    }

                    if (streamSnapshot.hasError) {
                      return const CircularProgressIndicator.adaptive(
                        backgroundColor: primaryColor1,
                      );
                    }

                    if (streamSnapshot.hasData) {
                      var docsData =
                          streamSnapshot.data as Map<String, dynamic>;

                      return Column(
                        children: [
                          Column(
                            children: [
                              // Appbar
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: size20px * 9,
                                decoration: const BoxDecoration(
                                  color: primaryColor1,
                                ),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                        width: double.infinity,
                                        child: Image.asset(
                                            "assets/images/background.png",
                                            fit: BoxFit.cover)),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: size20px * 1.5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: size20px),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Welcome Back,",
                                                      style: text12.copyWith(
                                                          color: whiteColor)),
                                                  const SizedBox(
                                                      height: size20px / 5),
                                                  SizedBox(
                                                    height: 30,
                                                    width: size20px * 10,
                                                    child: Text(
                                                      "${streamSnapshot.data['firstName'] == "" ? "new" : streamSnapshot.data['firstName']} ${streamSnapshot.data['lastName'] == "" ? "user" : streamSnapshot.data['lastName']}",
                                                      style: text16.copyWith(
                                                          color: whiteColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: const BoxDecoration(
                                                        color: secondaryColor1,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0))),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        /* With go_router */
                                                        context.go(
                                                            "/home/notification");
                                                      },
                                                      icon: Image.asset(
                                                          "assets/images/icon_notification.png",
                                                          width: 24,
                                                          height: 24),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                      width: size20px / 2),
                                                  streamSnapshot.data['role'] ==
                                                              "Agent" ||
                                                          streamSnapshot.data[
                                                                  'role'] ==
                                                              "Customer"
                                                      ? Container(
                                                          height: 40.0,
                                                          width: 40.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color:
                                                                secondaryColor1,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5.0)),
                                                          ),
                                                          child:
                                                              const CartButton(),
                                                        )
                                                      : Container()
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: size20px / 1.5),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: size20px * 2.5,
                                            child: Form(
                                              child: TextFormField(
                                                readOnly: true,
                                                onTap: () =>
                                                    /* With go_router */
                                                    context.go("/home/search"),
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greyColor3),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          size20px / 2),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: greyColor3),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(
                                                          size20px / 2),
                                                    ),
                                                  ),
                                                  filled: true,
                                                  fillColor: whiteColor,
                                                  prefixIcon: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            right: 15.0),
                                                    child: Image.asset(
                                                      "assets/images/icon_search.png",
                                                      width: 24.0,
                                                      height: 24.0,
                                                    ),
                                                  ),
                                                  hintText:
                                                      "What do you want to search?",
                                                  hintStyle:
                                                      body1Regular.copyWith(
                                                          color: greyColor),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // End of AppBar

                              // Main Content
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: size20px,
                                    vertical: size20px - 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /* 4 Menu Section */
                                    streamSnapshot.data != null
                                        ? streamSnapshot.data['role'] == "Sales"
                                            ? BlocBuilder<SalesforceLoginBloc,
                                                    SalesforceLoginState>(
                                                builder: (context, state) {
                                                if (state
                                                    is SalesforceLoginLoading) {
                                                  return Shimmer.fromColors(
                                                    baseColor: greyColor,
                                                    highlightColor: greyColor4,
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 5,
                                                              child: Container(
                                                                height: 60,
                                                                width: 160,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10)),
                                                                    color:
                                                                        whiteColor),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 15.0),
                                                            Expanded(
                                                              flex: 5,
                                                              child: Container(
                                                                height: 60,
                                                                width: 160,
                                                                decoration: const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(Radius.circular(
                                                                            10)),
                                                                    color:
                                                                        whiteColor),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top:
                                                                      size20px *
                                                                          0.75,
                                                                  bottom:
                                                                      size20px),
                                                          child: Row(
                                                            children: [
                                                              // ALL PRODUCTS
                                                              Expanded(
                                                                flex: 5,
                                                                child:
                                                                    Container(
                                                                  height: 60,
                                                                  width: 160,
                                                                  decoration: const BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              10)),
                                                                      color:
                                                                          whiteColor),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }

                                                if (state
                                                    is SalesforceLoginDone) {
                                                  return MenuGridWidgetSales(
                                                    accessToken: state
                                                        .loginEntity!
                                                        .accessToken!,
                                                  );
                                                }

                                                return Container();
                                              })
                                            : const MenuGridWidget()
                                        : Container(),
                                    /* End 4 Menu Section */

                                    /* Top Product Section */
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text("Our Top Products",
                                            style: text18),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: secondaryColor5,
                                            borderRadius: BorderRadius.circular(
                                                size20px * 5),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              var topProductBloc = BlocProvider
                                                  .of<TopProductBloc>(context);

                                              topProductBloc
                                                  .add(const GetTopProduct());

                                              /* With go_router */
                                              context.go("/home/top_products");
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: size20px / 2,
                                                      vertical: size20px / 5),
                                              child: Text(
                                                "See More",
                                                style: text12.copyWith(
                                                    color: secondaryColor1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: size20px / 2, top: size20px),
                                      child: BlocBuilder<TopProductBloc,
                                              TopProductState>(
                                          builder: (context, state) {
                                        if (state is TopProductLoading) {
                                          return Shimmer.fromColors(
                                            baseColor: greyColor3,
                                            highlightColor: greyColor,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 2,
                                                      crossAxisSpacing: 15,
                                                      mainAxisSpacing: 15,
                                                      childAspectRatio: 0.62),
                                              itemCount: 4,
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) =>
                                                  const Card(),
                                            ),
                                          );
                                        } else if (state is TopProductDone) {
                                          return GridView.builder(
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 15,
                                                    mainAxisSpacing: 15,
                                                    childAspectRatio: 0.6),
                                            itemCount:
                                                state.topProductData!.isNotEmpty
                                                    ? 4
                                                    : 0,
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () async {
                                                  // print(state
                                                  //     .topProductData![index]
                                                  //     .seoUrl);
                                                  context.pushNamed("product",
                                                      pathParameters: {
                                                        'url': state
                                                            .topProductData![
                                                                index]
                                                            .seoUrl!
                                                      });

                                                  Map<String, dynamic> data = {
                                                    "productName": state
                                                        .topProductData![index]
                                                        .productname,
                                                    "seo_url": state
                                                        .topProductData![index]
                                                        .seoUrl,
                                                    "casNumber": state
                                                        .topProductData![index]
                                                        .casNumber,
                                                    "hsCode": state
                                                        .topProductData![index]
                                                        .hsCode,
                                                    "productImage": state
                                                        .topProductData![index]
                                                        .productimage
                                                  };

                                                  await _addRecentlySeen(
                                                      param: data);
                                                },
                                                child: Card(
                                                  shadowColor: blackColor,
                                                  elevation: 3.0,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: size24px /
                                                                    4,
                                                                right:
                                                                    size24px /
                                                                        4,
                                                                top: size24px /
                                                                    4),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                size20px / 2),
                                                          ),
                                                          child: SizedBox(
                                                            height:
                                                                size20px * 5.5,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  "$url${state.topProductData![index].productimage}",
                                                              fit: BoxFit.fill,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  const Center(
                                                                child: CircularProgressIndicator
                                                                    .adaptive(),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  const Icon(Icons
                                                                      .error),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      10.0),
                                                          child: Text(
                                                            state
                                                                    .topProductData![
                                                                        index]
                                                                    .productname ??
                                                                "",
                                                            style: text14,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0),
                                                        child: Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    "CAS Number :",
                                                                    style:
                                                                        text10),
                                                                Text(
                                                                    state
                                                                            .topProductData![
                                                                                index]
                                                                            .casNumber ??
                                                                        "",
                                                                    style: text10
                                                                        .copyWith(
                                                                            color:
                                                                                greyColor2)),
                                                              ],
                                                            ),
                                                            const Spacer(),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                    "HS Code :",
                                                                    style:
                                                                        text10),
                                                                Text(
                                                                    state
                                                                            .topProductData![
                                                                                index]
                                                                            .hsCode ??
                                                                        "",
                                                                    style: text10
                                                                        .copyWith(
                                                                            color:
                                                                                greyColor2)),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: SizedBox(
                                                                height: 30,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child: ElevatedButton(
                                                                    style: ButtonStyle(
                                                                        backgroundColor: MaterialStateProperty.all<Color>(primaryColor1),
                                                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                          RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7.0),
                                                                          ),
                                                                        ),
                                                                        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
                                                                    onPressed: () {
                                                                      List<ProductToRfq>
                                                                          products =
                                                                          [];
                                                                      ProductToRfq
                                                                          product =
                                                                          ProductToRfq(
                                                                        productName: state
                                                                            .topProductData![index]
                                                                            .productname!,
                                                                        productImage: state
                                                                            .topProductData![index]
                                                                            .productimage!,
                                                                        hsCode: state
                                                                            .topProductData![index]
                                                                            .hsCode!,
                                                                        casNumber: state
                                                                            .topProductData![index]
                                                                            .casNumber!,
                                                                      );
                                                                      products.add(
                                                                          product);

                                                                      RequestQuotationParameter
                                                                          param =
                                                                          RequestQuotationParameter(
                                                                        products:
                                                                            products,
                                                                      );
                                                                      context.go(
                                                                          "/home/request_quotation",
                                                                          extra:
                                                                              param);
                                                                    },
                                                                    child: Text(
                                                                      "Send Inquiry",
                                                                      style: text12
                                                                          .copyWith(
                                                                        color:
                                                                            whiteColor,
                                                                      ),
                                                                    )),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 2),
                                                            Container(
                                                              height: 30,
                                                              width: 30,
                                                              decoration: const BoxDecoration(
                                                                  color:
                                                                      secondaryColor1,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              5))),
                                                              child: AddToCartButton(
                                                                  listProduct: state
                                                                      .topProductData!,
                                                                  index: index),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          return Center(
                                            child: Text(
                                              "Error",
                                              style: heading1.copyWith(
                                                  color: redColor1),
                                            ),
                                          );
                                        }
                                      }),
                                    ),
                                    /* End Top Product Section */

                                    /* Industry Section */
                                    const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: size20px),
                                        child: Text("Industry", style: text18)),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                      width: MediaQuery.of(context).size.width,
                                      child: GridView(
                                        padding: EdgeInsets.zero,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                crossAxisSpacing: 5,
                                                mainAxisSpacing: 5,
                                                childAspectRatio: 0.9),
                                        children: [
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_agri.png",
                                              onPressed: () {},
                                              topIndustryName: "Agriculture"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_animal.png",
                                              onPressed: () {},
                                              topIndustryName: "Animal Feed"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_beauty.png",
                                              onPressed: () {},
                                              topIndustryName:
                                                  "Beauty & Personal Care"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_food.png",
                                              onPressed: () {},
                                              topIndustryName:
                                                  "Food & Beverage"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_glass.png",
                                              onPressed: () {},
                                              topIndustryName:
                                                  "Glass & Ceramic"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_leather.png",
                                              onPressed: () {},
                                              topIndustryName: "Leather"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_metal.png",
                                              onPressed: () {},
                                              topIndustryName: "Metal & Steel"),
                                          TopIndustryWidget(
                                              icon:
                                                  "assets/images/icon_all_industry.png",
                                              onPressed: () {
                                                context
                                                    .go("/home/all_industry");
                                              },
                                              topIndustryName:
                                                  "All Industries"),
                                        ],
                                      ),
                                    ),
                                    /* End Industry Section */

                                    /* Last seen Section */
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.0),
                                      child: Text("Last Seen Products",
                                          style: text18),
                                    ),
                                    docsData["recentlySeen"] == null ||
                                            docsData["recentlySeen"].length == 0
                                        ? const Center(
                                            child: Text("Tidak ada product"))
                                        : Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: size20px),
                                                child: GridView.builder(
                                                  gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 15,
                                                          mainAxisSpacing: 15,
                                                          childAspectRatio:
                                                              0.7),
                                                  itemCount: docsData[
                                                                  "recentlySeen"]
                                                              .length <
                                                          4
                                                      ? docsData["recentlySeen"]
                                                          .length
                                                      : 4,
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Card(
                                                      shadowColor: blackColor,
                                                      elevation: 3.0,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(
                                                                left: size24px /
                                                                    4,
                                                                right:
                                                                    size24px /
                                                                        4,
                                                                top: size24px /
                                                                    4),
                                                            child: ClipRRect(
                                                              borderRadius: const BorderRadius
                                                                      .all(
                                                                  Radius.circular(
                                                                      size20px /
                                                                          2)),
                                                              child: SizedBox(
                                                                height:
                                                                    size20px *
                                                                        5.5,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl:
                                                                      "$url${docsData["recentlySeen"][index]["productImage"]}",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      const Center(
                                                                    child: CircularProgressIndicator
                                                                        .adaptive(),
                                                                  ),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      const Icon(
                                                                          Icons
                                                                              .error),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5.0,
                                                                  horizontal:
                                                                      10.0),
                                                              child: Text(
                                                                docsData["recentlySeen"]
                                                                        [index][
                                                                    "productName"],
                                                                style: text14,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical:
                                                                    size20px /
                                                                        4),
                                                            child: Row(
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                        "CAS Number :",
                                                                        style:
                                                                            text10),
                                                                    Text(
                                                                        docsData["recentlySeen"][index]
                                                                            [
                                                                            "casNumber"],
                                                                        // "",
                                                                        style: text10.copyWith(
                                                                            color:
                                                                                greyColor2)),
                                                                  ],
                                                                ),
                                                                const Spacer(),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                        "HS Code :",
                                                                        style:
                                                                            text10),
                                                                    Text(
                                                                        docsData["recentlySeen"][index]
                                                                            [
                                                                            "hsCode"],
                                                                        // "",
                                                                        style: text10.copyWith(
                                                                            color:
                                                                                greyColor2)),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              /* Button See More */
                                              Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: secondaryColor5,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            size20px * 5),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal:
                                                              size20px / 2,
                                                          vertical:
                                                              size20px / 5),
                                                      child: Text(
                                                        "Load More",
                                                        style: text12.copyWith(
                                                            color:
                                                                secondaryColor1),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              /* End Button See More */
                                            ],
                                          ),
                                    /* End Lastseen Section */
                                  ],
                                ),
                              )
                              // End of Main Content
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

class TopIndustryWidget extends StatelessWidget {
  const TopIndustryWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.topIndustryName,
  });

  final String icon;
  final String topIndustryName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: thirdColor1,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
              ),
              Image.asset(
                icon,
                color: primaryColor1,
                width: size24px,
                height: size24px,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Text(
              topIndustryName,
              style: text10,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class MenuGridWidget extends StatelessWidget {
  const MenuGridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // RFQ & Tracking Doc menu baris 1
        Row(
          children: [
            // RFQ
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  /* With go_router */
                  RequestQuotationParameter param = RequestQuotationParameter(
                    products: [],
                  );
                  context.go("/home/request_quotation", extra: param);
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [rfqMuda, rfqTua]),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 12.0, bottom: 12.0),
                      child: Text("Request for \nQuotation",
                          style: text12.copyWith(
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_target.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            // TRACKINGDOC
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  /* With go_router */
                  context.push("/history/tracking_document");
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return const TrackingDocumentScreen();
                  //   },
                  // ));
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [trackingDocMuda, trackingDocTua]),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 12.0, bottom: 12.0),
                      child: Text("Tracking \nDocument",
                          style: text12.copyWith(
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_docs.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            )
          ],
        ),
        // Tracking Ship & All Products menu baris 1
        Padding(
          padding:
              const EdgeInsets.only(top: size20px * 0.75, bottom: size20px),
          child: Row(
            children: [
              // TRACKINGSHIP
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    /* With go_router */
                    context.push("/history/tracking_shipment");

                    // Navigator.push(context, MaterialPageRoute(
                    //   builder: (context) {
                    //     return const TrackingShipmentScreen();
                    //   },
                    // ));
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [trackingShipMuda, trackingShipTua]),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 12.0, bottom: 12.0),
                        child: Text("Tracking \nShipment",
                            style: text12.copyWith(
                                color: whiteColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Image.asset(
                            "assets/images/icon_boat.png",
                            color: whiteColor,
                            width: size20px * 3,
                          )),
                    ]),
                  ),
                ),
              ),
              const SizedBox(width: 15.0),
              // ALL PRODUCTS
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    context.go("/home/all_products");
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [allProductsMuda, allProductsTua]),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 12.0, bottom: 12.0),
                        child: Text("All \nProducts",
                            style: text12.copyWith(
                                color: whiteColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Image.asset(
                            "assets/images/icon_box.png",
                            color: whiteColor,
                            width: size20px * 3,
                          )),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MenuGridWidgetSales extends StatelessWidget {
  const MenuGridWidgetSales({Key? key, required this.accessToken})
      : super(key: key);

  final String accessToken;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Tracking Doc menu baris 1
        Row(
          children: [
            // TRACKINGSHIP
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      // return const TrackingShipmentScreen();
                      // return const ShipGoScreen();
                      return SalesForceLoginScreen(
                        token: accessToken,
                      );
                    },
                  ));

                  // log(accessTokenData);
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [trackingShipMuda, trackingShipTua]),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 12.0, bottom: 12.0),
                      child: Text("Tracking \nShipment",
                          style: text12.copyWith(
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_boat.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            // TRACKINGDOC
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TrackingDocumentScreen();
                    },
                  ));
                },
                child: Container(
                  height: 60,
                  width: 160,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [trackingDocMuda, trackingDocTua]),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, top: 12.0, bottom: 12.0),
                      child: Text("Tracking \nDocument",
                          style: text12.copyWith(
                              color: whiteColor, fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Image.asset(
                          "assets/images/icon_docs.png",
                          color: whiteColor,
                          width: size20px * 3,
                        )),
                  ]),
                ),
              ),
            )
          ],
        ),
        // Tracking Ship & All Products menu baris 2
        Padding(
          padding:
              const EdgeInsets.only(top: size20px * 0.75, bottom: size20px),
          child: Row(
            children: [
              // ALL PRODUCTS
              Expanded(
                flex: 5,
                child: InkWell(
                  onTap: () {
                    context.go("/home/all_products");
                  },
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [allProductsMuda, allProductsTua]),
                    ),
                    child: Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 12.0, bottom: 12.0),
                        child: Text("All \nProducts",
                            style: text12.copyWith(
                                color: whiteColor,
                                fontWeight: FontWeight.w600)),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Image.asset(
                            "assets/images/icon_box.png",
                            color: whiteColor,
                            width: size20px * 3,
                          )),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
