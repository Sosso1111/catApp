class Image {
  final String id;
  final int width;
  final int height;
  final String url;

  Image(
      {required this.id,
        required this.width,
        required this.height,
        required this.url
      });

  factory Image.fromJson(Map<String, dynamic> json){
    if (!json.containsKey('id')){
      return Image(id: "", width: 0, height: 0, url: "");
    }

    return Image(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url']
    );
  }
}