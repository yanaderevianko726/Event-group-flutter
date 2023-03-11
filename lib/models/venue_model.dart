
class VenueModel {
  String? venueId;
  String? venueName;
  String? address;
  String? description;
  String? image;
  String? setTime;
  String? startTime;
  String? finishTime;
  String? slots;
  String? location;
  String? lat;
  String? lang;
  String? radius;
  String? serviceDescription;

  VenueModel({
    this.venueId = '',
    this.venueName = '',
    this.address = '',
    this.description = '',
    this.image = '',
    this.setTime = '',
    this.startTime = '',
    this.finishTime = '',
    this.slots = '',
    this.location = '',
    this.lat = '',
    this.lang = '',
    this.radius = '',
    this.serviceDescription = '',
  });

  factory VenueModel.fromJson(Map<String, dynamic> json) => VenueModel(
    venueId: json["venueId"] ?? '',
    venueName: json["venueName"] ?? '',
    address: json["address"] ?? '',
    description: json["description"] ?? '',
    image: json["image"] ?? '',
    setTime: json["setTime"] ?? '',
    startTime: json["startTime"] ?? '',
    finishTime: json["finishTime"] ?? '',
    slots: json["slots"] ?? '',
    location: json["location"] ?? '',
    lat: json["lat"] ?? '',
    lang: json["lang"] ?? '',
    radius: json["radius"] ?? '',
    serviceDescription: json["serviceDescription"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "venueId": venueId,
    "venueName": venueName,
    "address": address,
    "description": description,
    "image": image,
    "setTime": setTime,
    "startTime": startTime,
    "finishTime": finishTime,
    "slots": slots,
    "location": location,
    "lat": lat,
    "lang": lang,
    "radius": radius,
    "serviceDescription": serviceDescription,
  };
}

