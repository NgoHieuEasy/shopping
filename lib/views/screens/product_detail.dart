import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/constant/app_utils.dart';
import 'package:market_ecommerce/core/common/primary_button.dart';
import 'package:market_ecommerce/core/model/Product.dart';
import 'package:market_ecommerce/views/screens/reviews_page.dart';
import 'package:market_ecommerce/views/widgets/bag_item.dart';
import 'package:market_ecommerce/views/widgets/custom_app_bar.dart';
import 'package:market_ecommerce/views/widgets/custom_icon_button_widget.dart';
import 'package:market_ecommerce/views/widgets/review_title.dart';
import 'package:star_rating/star_rating.dart';

class ProductDetail extends StatefulWidget {
  final Product data;
  const ProductDetail({required this.data, super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product product;
  int sizeIdx = 0;
  int colorIdx = 0;

  @override
  void initState() {
    product = widget.data;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: AppColor.border, width: 1))),
          child: Row(children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.secondary),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(AppRelativePath.chatIcon),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width - 80,
                margin: const EdgeInsets.only(left: 10),
                child: PrimaryButton(text: "Add to Cart", onPressed: () {}))
          ]),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                children: [
                  //app bar
                  CustomAppBar(
                    name: product.store_name,
                    onTapLead: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  // body product

                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      "${product.image[0]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Text(
                            "${product.name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 25),
                          )),
                          BagItem(
                            rating: product.rating,
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "Price: ${AppUtils.formatCurrency(product.price)}",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          "${product.description}",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 15),
                        ),
                      ),

                      //color
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Color",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 5),
                                child: Wrap(
                                  spacing: 10,
                                  children: List.generate(product.colors.length,
                                      (index) {
                                    var colorItem = product.colors[index];
                                    return Column(
                                      children: [
                                        Text("${colorItem.name}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              colorIdx = index;
                                            });
                                          },
                                          child: Container(
                                            height: 60,
                                            width: 60,
                                            padding: const EdgeInsets.all(6),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: colorIdx == index
                                                        ? AppColor.primary
                                                        : Colors.transparent,
                                                    width: 2)),
                                            child: Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: colorItem.color,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                                ),
                              )
                            ],
                          )),
                      //size
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: Text(
                                  "Size",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5, left: 5),
                                child: Wrap(
                                  spacing: 10,
                                  children: List.generate(product.sizes.length,
                                      (index) {
                                    var sizeItem = product.sizes[index];
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          sizeIdx = index;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: sizeIdx == index
                                                ? AppColor.primary
                                                : AppColor.border,
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Text(
                                          "${sizeItem.name}",
                                          style: TextStyle(
                                              color: sizeIdx == index
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            ],
                          )),

                      // review

                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: AppColor.border, width: 1))),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          childrenPadding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                          tilePadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          title: Text(
                            "Reviews",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          children: [
                            ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ReviewTitle(
                                      review: product.reviews[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 16),
                                itemCount: 2),
                            Container(
                              margin:
                                  EdgeInsets.only(left: 52, top: 12, bottom: 6),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ReviewsPage(
                                        reviews: product.reviews,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'See More Reviews',
                                  style: TextStyle(
                                      color: AppColor.secondary,
                                      fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: AppColor.primary,
                                  elevation: 0,
                                  backgroundColor: AppColor.primarySoft,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
