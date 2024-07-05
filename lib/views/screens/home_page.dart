import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_utils.dart';
import 'package:market_ecommerce/core/model/Category.dart';
import 'package:market_ecommerce/core/model/Product.dart';
import 'package:market_ecommerce/core/services/CategoryService.dart';
import 'package:market_ecommerce/core/services/ProductService.dart';
import 'package:market_ecommerce/views/screens/search_page.dart';
import 'package:market_ecommerce/views/widgets/category_card.dart';
import 'package:market_ecommerce/views/widgets/flashsale_countdown_tile.dart';
import 'package:market_ecommerce/views/widgets/item_card.dart';
import 'package:market_ecommerce/views/widgets/custom_icon_button_widget.dart';
import 'package:market_ecommerce/views/widgets/dummy_search_widget_1.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  List<Category> categoryData = CategoryService.categoryData;
  List<Product> productData = ProductService.productData;
  int _catIdx = 0;

  late Timer flashsaleCountdownTimer;
  Duration flashsaleCountdownDuration = Duration(
    hours: 24 - DateTime.now().hour,
    minutes: 60 - DateTime.now().minute,
    seconds: 60 - DateTime.now().second,
  );

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (_) {
      setCountdown();
    });
  }

  void setCountdown() {
    if (this.mounted) {
      setState(() {
        final seconds = flashsaleCountdownDuration.inSeconds - 1;
        print("result::::: $seconds");
        if (seconds < 1) {
          flashsaleCountdownTimer.cancel();
        } else {
          flashsaleCountdownDuration = Duration(seconds: seconds);
        }
      });
    }
  }

  @override
  void dispose() {
    if (flashsaleCountdownTimer != null) {
      flashsaleCountdownTimer.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String seconds = flashsaleCountdownDuration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String minutes = flashsaleCountdownDuration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');
    String hours = flashsaleCountdownDuration.inHours
        .remainder(24)
        .toString()
        .padLeft(2, '0');
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //section 1
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            height: 190,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppRelativePath.backgroundImg),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Find the best \noutfit for you",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          child: Row(children: [
                            CustomIconButtonWidget(
                              icon: SvgPicture.asset(
                                AppRelativePath.bagIcon,
                                color: Colors.white,
                              ),
                              value: 0,
                              onTap: () {},
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomIconButtonWidget(
                              icon: SvgPicture.asset(
                                AppRelativePath.messageIcon,
                                color: Colors.white,
                              ),
                              value: 10,
                              onTap: () {},
                            ),
                          ]),
                        )
                      ]),
                ),
                SizedBox(
                  height: 40,
                ),
                DummySearchWidget1(
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SearchPage()))
                  },
                )
              ],
            ),
          ),

          Expanded(
            child: SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: const MaterialClassicHeader(),
              controller: _refreshController,
              onRefresh: () {
                _refreshController.refreshCompleted();
                _refreshController.loadComplete();
              },
              onLoading: () {
                _refreshController.refreshCompleted();
                _refreshController.loadComplete();
              },
              child: ListView(
                shrinkWrap: true,
                // physics: BouncingScrollPhysics(),
                children: [
                  // section 2 - category
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    color: AppColor.secondary,
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Category",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          Text(
                            "View more",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 13),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 96,
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 16,
                              );
                            },
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                  catIdx: _catIdx,
                                  data: categoryData[index],
                                  onTap: () {
                                    setState(() {
                                      _catIdx = index;
                                    });
                                  });
                            },
                            itemCount: categoryData.length),
                      )
                    ]),
                  ),
                  // section 3 - Flash sale
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Flash Sale',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: hours[0],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: hours[1],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: minutes[0],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: minutes[1],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: seconds[0],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 2.0),
                                    child: FlashsaleCountdownTile(
                                      digit: seconds[1],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 15),
                          alignment: Alignment.topRight,
                          child: Text(
                            "View more",
                            style: TextStyle(
                                color: Colors.yellow,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 4,
                          ),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 16,
                            children: List.generate(
                              2,
                              (index) => Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 26,
                                height: 250,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ItemCard(
                                      product: productData[index],
                                      // titleColor: AppColor.primarySoft,
                                      // priceColor: AppColor.accent,
                                    ),
                                    Container(
                                      width: 180,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: LinearProgressIndicator(
                                                  minHeight: 10,
                                                  value: 0.4,
                                                  color: AppColor.accent,
                                                  backgroundColor:
                                                      AppColor.border,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.local_fire_department,
                                            color: AppColor.accent,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: Container(
                                    //         color: Colors.amber,
                                    //         height: 10,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),

                  // section 4 - list item
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Popular",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children:
                                List.generate(productData.length, (index) {
                              return Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      16 -
                                      8,
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
                                          color:
                                              Colors.black.withOpacity(0.015),
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
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
