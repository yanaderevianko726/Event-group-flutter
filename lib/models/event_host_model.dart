
class EventHostModel {
  String? hostId;
  String? city;

  EventHostModel({
    this.hostId = '',
    this.city = '',
  });

  factory EventHostModel.fromJson(Map<String, dynamic> json) => EventHostModel(
    hostId: json["hostId"] ?? '',
    city: json["city"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "hostId": hostId,
    "city": city,
  };
}

