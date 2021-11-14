class Product {
  int? id;
  String? name;
  String? barcode;
  double? amount;
  String? explanation;

  Product({this.id, this.name, this.barcode, this.amount, this.explanation});

  Product.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    barcode = json["barcode"];
    amount = json["amount"];
    explanation = json["explanation"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["barcode"] = barcode;
    map["amount"] = amount;
    map["explanation"] = explanation;
    return map;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["barcode"] = barcode;
    map["amount"] = amount;
    map["explanation"] = explanation;
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = o["id"];
    this.name = o["name"];
    this.barcode = o["barcode"];
    this.amount = o["amount"];
    this.explanation = o["explanation"];
  }
}
