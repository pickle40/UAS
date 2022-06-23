class LikedPost {
  final String ptitle;
  final String ppubDate;
  final String pdescription;
  final String pthumbnail;
  final String plink;

  LikedPost(
      {required this.ptitle,
      required this.ppubDate,
      required this.pdescription,
      required this.pthumbnail,
      required this.plink});

  Map<String, dynamic> toJson() {
    return {
      "title": ptitle,
      "pubDate": ppubDate,
      "pdescription": pdescription,
      "pthumbnail": pthumbnail,
      "plink": plink,
    };
  }

  factory LikedPost.fromJson(Map<String, dynamic> json) {
    return LikedPost(
        ptitle: json['title'],
        ppubDate: json['pubDate'],
        pdescription: json['description'],
        pthumbnail: json['thumbnail'],
        plink: json['link']);
  }
}
