import 'package:flutter/material.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/core/model/Review.dart';
import 'package:star_rating/star_rating.dart';

class ReviewTitle extends StatelessWidget {
  const ReviewTitle({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          child: Image.asset(
            "${review.photo_url}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${review.name}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary),
                    ),
                  ),
                  StarRating(
                    mainAxisAlignment: MainAxisAlignment.center,
                    length: 5,
                    rating: review.rating,
                    between: 5,
                    starSize: 20,
                    onRaitingTap: (rating) {},
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text("${review.review}"),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
