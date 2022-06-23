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

  static List<cPost> data = [
    cPost(
        ctitle: "Eropa CLBK ke Batu Bara, Bagaimana Nasib Perubahan Iklim?",
        cpubDate: "2022-06-23T06:25:00.000Z",
        cdescription:
            "Berkurangnya pasokan gas Rusia ke kawasan Eropa membuat sejumlah negara kebakaran jenggot.",
        cthumbnail:
            "https://awsimages.detik.net.id/visual/2018/07/19/3d4887f9-f0a7-4938-ba86-0e02325a180e_169.jpeg?w=360&q=90",
        clink:
            "https://www.cnbcindonesia.com/news/20220623113143-4-349634/eropa-clbk-ke-batu-bara-bagaimana-nasib-perubahan-iklim"),
    cPost(
        ctitle: "Jokowi Mau Temui Zelensky dan Putin, DPR: Langkah Tepat",
        cpubDate: "2022-06-23T06:24:33.000Z",
        cdescription:
            "Langkah Presiden Jokowi untuk menemui Zelensky dan Putin menunjukkan peran Indonesia semakin nyata dalam mengusahakan perdamaian",
        cthumbnail:
            "https://awsimages.detik.net.id/visual/2022/06/23/dpr-apresiasi-upaya-jokowi-damaikan-rusia-ukraina_169.jpeg?w=360&q=90",
        clink:
            "https://www.cnbcindonesia.com/news/20220623131443-4-349674/jokowi-mau-temui-zelensky-putin-dpr-langkah-tepat"),
    cPost(
        ctitle: "ulan Jameela Singgung PHK di LinkAja, Ganggu Digital SPBU?",
        cpubDate: "2022-06-23T06:22:20.000Z",
        cdescription:
            "Mulan Jameela Anggota Komisi VII DPR menyinggung adanya PHK besar-besaran di LinkAja yang bisa mengganggu digitalisasi SPBU",
        cthumbnail:
            "https://awsimages.detik.net.id/visual/2019/10/18/d9bc52e5-d583-42f7-81fa-72cf31f80a3d_169.png?w=360&q=90",
        clink:
            "https://www.cnbcindonesia.com/news/20220623131535-4-349672/mulan-jameela-singgung-phk-di-linkaja-ganggu-digital-spbu"),
  ];

  Map<String, dynamic> toJson() {
    return {
      "title": ctitle,
      "pubDate": cpubDate,
      "pdescription": cdescription,
      "pthumbnail": cthumbnail,
      "plink": clink,
    };
  }
}
