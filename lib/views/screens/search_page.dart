import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_ecommerce/constant/app_color.dart';
import 'package:market_ecommerce/constant/app_relative_path.dart';
import 'package:market_ecommerce/core/model/Search.dart';
import 'package:market_ecommerce/core/services/SearchService.dart';
import 'package:market_ecommerce/views/screens/search_result_page.dart';
import 'package:market_ecommerce/views/widgets/custom_input_search.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchHistotry> listSearchHistory = SearchService.listSearchHistory;
  List<PopularSearch> listPopularSearch = SearchService.listPopularSearch;

  void handleSubmitted(String value) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SearchResultPage(keyword: value)));
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
          title: CustomSearchInput(onValue: handleSubmitted)),
      body: Container(
          margin: const EdgeInsets.all(15),
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search history...",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${listSearchHistory[index].title}",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7)),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                      itemCount: listSearchHistory.length),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.2)),
                    child: Text(
                      "Delete search history",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Popular search",
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      child: Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: listPopularSearch.map((data) {
                          return Container(
                            width: MediaQuery.of(context).size.width / 2 - 24,
                            child: Row(children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                      data.image_url,
                                    )),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(data.title),
                                ),
                              )
                            ]),
                          );
                        }).toList(),
                      ))
                ],
              )
            ],
          )),
    );
  }
}
