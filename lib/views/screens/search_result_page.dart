import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/core/model/Product.dart';
import 'package:market_ecommerce/core/model/Search.dart';
import 'package:market_ecommerce/core/services/ProductService.dart';
import 'package:market_ecommerce/core/services/SearchService.dart';
import 'package:market_ecommerce/views/screens/search_result_page.dart';
import 'package:market_ecommerce/views/widgets/custom_input_search.dart';
import 'package:market_ecommerce/views/widgets/item_card.dart';

class SearchResultPage extends StatefulWidget {
  final String keyword;
  const SearchResultPage({required this.keyword, super.key});

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage>
    with TickerProviderStateMixin {
  late TabController tabController;
  late List<Product> productData;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    handleFilterProduct();
  }

  void handleFilterProduct() {
    productData = ProductService.productData.where((data) {
      log((data.name == widget.keyword).toString());
      return data.name.toLowerCase().contains(widget.keyword.toLowerCase());
    }).toList();
  }

  void handleSubmitted(String value) {
    if (value.isEmpty) {
      setState(() {
        productData = ProductService.productData;
      });
    } else {
      setState(() {
        productData = ProductService.productData.where((data) {
          log((data.name == widget.keyword).toString());
          return data.name.toLowerCase().contains(value.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.primary,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: SvgPicture.asset(
                AppRelativePath.arrowLeftIcon,
                color: Colors.white,
              )),
          title: CustomSearchInput(onValue: handleSubmitted),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: AppColor.secondary,
              child: TabBar(
                controller: tabController,
                indicatorColor: AppColor.accent,
                indicatorWeight: 5,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'poppins',
                    fontSize: 12),
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'poppins',
                    fontSize: 12),
                tabs: [
                  Tab(
                    text: 'Related',
                  ),
                  Tab(
                    text: 'Newest',
                  ),
                  Tab(
                    text: 'Popular',
                  ),
                  Tab(
                    text: 'Best Seller',
                  ),
                ],
              ),
            ),
          )),
      body: TabBarView(controller: tabController, children: [
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(productData.length, (index) {
                        return Container(
                            width:
                                MediaQuery.of(context).size.width / 2 - 16 - 8,
                            height: 210,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: List.generate(3, (index) {
                                  final offsets = [
                                    const Offset(1, 1),
                                    const Offset(1, 1),
                                    const Offset(1, 1),
                                  ];
                                  return BoxShadow(
                                    color: Colors.black.withOpacity(0.015),
                                    offset: offsets[index],
                                    blurRadius: 5,
                                    spreadRadius: 1,
                                  );
                                })),
                            child: ItemCard(
                              product: productData[index],
                            ));
                      }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ]),
    );
  }
}
