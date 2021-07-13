// @dart=2.9
class MyItemModel {
  String title;
  String image;
  int price;
  int qte;
  MyItemModel({this.title, this.image, this.price, this.qte = 1});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "image": image,
      "price": price,
      "qte": qte,
    };
  }

  MyItemModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    image = json["image"];
    price = json["price"];
    qte = json["qte"];
  }
}
