
class MessageChannelModel {
  String? userId;
  String? otherId;
  String? eventId;
  String? otherName;
  String? channelId;
  String? otherImage;

  MessageChannelModel({
    this.userId = '',
    this.otherId = '',
    this.eventId = '',
    this.otherName = '',
    this.channelId = '',
    this.otherImage = '',
  });

  factory MessageChannelModel.fromJson(Map<String, dynamic> json) => MessageChannelModel(
    userId: json["userId"] ?? '',
    otherId: json["otherId"] ?? '',
    eventId: json["eventId"] ?? '',
    otherName: json["otherName"] ?? '',
    channelId: json["channelId"] ?? '',
    otherImage: json["otherImage"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "otherId": otherId,
    "eventId": eventId,
    "otherName": otherName,
    "channelId": channelId,
    "otherImage": otherImage,
  };
}
