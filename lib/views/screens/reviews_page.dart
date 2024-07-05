import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/core/model/Review.dart';
import 'package:market_ecommerce/views/widgets/custom_app_bar.dart';
import 'package:market_ecommerce/views/widgets/review_title.dart';
import 'package:star_rating/star_rating.dart';

class ReviewsPage extends StatefulWidget {
  final List<Review> reviews;

  const ReviewsPage({required this.reviews, super.key});

  @override
  State<ReviewsPage> createState() => _ReviewsPageState();
}

class _ReviewsPageState extends State<ReviewsPage> {
  late List<Review> filterReviewList;

  int reviewIdx = 0;

  bool isLoading = false;

  @override
  void initState() {
    filterReviewList = widget.reviews;
    super.initState();
  }

  void handleFilterReview(index) {
    if (index != 0) {
      filterReviewList = widget.reviews.where((e) {
        return e.rating == index;
      }).toList();
    } else {
      filterReviewList = widget.reviews;
    }
    setState(() {
      reviewIdx = index;
      isLoading = true;
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                CustomAppBar(
                  name: "Reviews",
                  onTapLead: () {
                    Navigator.of(context).pop();
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 + 60,
                  child: Row(children: [
                    Text(
                      "4.0",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      children: [
                        StarRating(
                          mainAxisAlignment: MainAxisAlignment.center,
                          length: 5,
                          rating: 0,
                          between: 5,
                          starSize: 30,
                          onRaitingTap: (rating) {},
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Text("Based on 36 Reviews",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.withOpacity(0.7))),
                        )
                      ],
                    )
                  ]),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 10),
                  width: MediaQuery.of(context).size.width / 2 + 70,
                  child: Wrap(
                    runSpacing: 12,
                    spacing: 12,
                    children: List.generate(
                        6,
                        (index) => GestureDetector(
                              onTap: () {
                                handleFilterReview(index);
                              },
                              child: Container(
                                width: 80,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: reviewIdx == index
                                        ? AppColor.primary
                                        : Colors.transparent,
                                    border: Border.all(
                                        color: Colors.grey, width: 1),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      (index != 0)
                                          ? Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 6),
                                              child: SvgPicture.asset(
                                                AppRelativePath.starActiveIcon,
                                                width: 20,
                                                height: 15,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : Container(),
                                      (index != 0)
                                          ? Container(
                                              child: Text(
                                                "${index} (3)",
                                                style: TextStyle(
                                                    color: reviewIdx == index
                                                        ? Colors.white
                                                        : Colors.grey),
                                              ),
                                            )
                                          : Container(
                                              child: Center(
                                                child: Text(
                                                  "All Reviews",
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: reviewIdx == index
                                                          ? Colors.white
                                                          : Colors.black),
                                                ),
                                              ),
                                            )
                                    ]),
                              ),
                            )),
                  ),
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                !isLoading
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ReviewTitle(
                                  review: filterReviewList[index]);
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 16),
                            itemCount: filterReviewList.length),
                      )
                    : Center(child: Text("Loading...")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
