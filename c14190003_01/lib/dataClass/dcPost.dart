class cPost {
  String ctitle;
  String cpubDate;
  String cdescription;
  String cthumbnail;
  String clink;

  cPost(
      {required this.ctitle,
      required this.cpubDate,
      required this.cdescription,
      required this.cthumbnail,
      required this.clink});

  factory cPost.fromJson(Map<String, dynamic> json) {
    return cPost(
        ctitle: json['title'],
        cpubDate: json['pubDate'],
        cdescription: json['description'],
        cthumbnail: json['thumbnail'],
        clink: json['link']);
  }
}
