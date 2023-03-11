class EventModel {
  String? eventId;
  String? venueName;
  String? userId;
  String? firstName;
  String? lastName;
  String? description;
  String? userImage;
  String? image;
  String? location;
  String? type;
  String? lat;
  String? lang;
  String? setupTime;
  String? startTime;
  String? finishTime;
  String? tentSlots;
  String? isFull;

  EventModel({
    this.eventId = '',
    this.userId = '',
    this.firstName = '',
    this.lastName = '',
    this.venueName = '',
    this.description = '',
    this.userImage = '',
    this.image = '',
    this.location = '',
    this.type = '',
    this.lat = '',
    this.lang = '',
    this.setupTime = '',
    this.startTime = '',
    this.finishTime = '',
    this.tentSlots = '',
    this.isFull = 'Not',
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventId: json["eventId"] ?? '',
        userId: json["userId"] ?? '',
        firstName: json["firstName"] ?? '',
        lastName: json["lastName"] ?? '',
        venueName: json["title"] ?? '',
        description: json["description"] ?? '',
        userImage: json["userImage"] ?? '',
        image: json["image"] ?? '',
        location: json["location"] ?? '',
        type: json["type"] ?? '',
        lat: json["lat"] ?? '',
        lang: json["lang"] ?? '',
        setupTime: json["setupTime"] ?? '',
        startTime: json["startTime"] ?? '',
        finishTime: json["finishTime"] ?? '',
        tentSlots: json["tentSlots"] ?? '',
        isFull: json["isFull"] ?? 'Not',
      );

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "userId": userId,
        "firstName": firstName,
        "lastName": lastName,
        "title": venueName,
        "description": description,
        "userImage": userImage,
        "image": image,
        "location": location,
        "type": type,
        "lat": lat,
        "lang": lang,
        "setupTime": setupTime,
        "startTime": startTime,
        "finishTime": finishTime,
        "tentSlots": tentSlots,
        "isFull": isFull,
      };
}
