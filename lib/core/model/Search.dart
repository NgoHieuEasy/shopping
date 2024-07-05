class SearchHistotry {
  final String title;
  SearchHistotry({required this.title});

  factory SearchHistotry.fromJson(Map<String, dynamic> json) {
    return SearchHistotry(title: json['title']);
  }
}

class PopularSearch {
  final String title;
  final String image_url;

  PopularSearch({required this.title, required this.image_url});

  factory PopularSearch.fromJson(Map<String, dynamic> json) {
    return PopularSearch(title: json['title'], image_url: json['image_url']);
  }
}
