class TentModel {
  String? userId;
  String? tentId;
  String? price;
  String? curTents;
  String? totalTents;
  String? size1;
  String? size2;
  String? vendorIds;

  TentModel({
    this.userId = '',
    this.tentId = '',
    this.price = '',
    this.curTents = '0',
    this.totalTents = '',
    this.size1 = '',
    this.size2 = '',
    this.vendorIds = '',
  });

  factory TentModel.fromJson(Map<String, dynamic> json) => TentModel(
        userId: json["userId"] ?? '',
        tentId: json["tentId"] ?? '',
        price: json["price"] ?? '',
        curTents: json["curTents"] ?? '',
        totalTents: json["totalTents"] ?? '',
        size1: json["size1"] ?? '',
        size2: json["size2"] ?? '',
        vendorIds: json["vendorIds"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "tentId": tentId,
        "price": price,
        "curTents": curTents,
        "totalTents": totalTents,
        "size1": size1,
        "size2": size2,
        "vendorIds": vendorIds,
      };
}
