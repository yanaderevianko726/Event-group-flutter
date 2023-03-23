
class NotificationModel {
  String? id;
  String? title;
  String? content;
  String? senderId;
  String? senderName;
  String? senderImage;
  String? isRead;
  String? fromId;
  String? fromName;
  String? fromImage;
  String? type;
  String? eventId;

  NotificationModel({
    this.id = '',
    this.title = '',
    this.content = '',
    this.senderId = '',
    this.senderName = '',
    this.senderImage = '',
    this.isRead = 'Not',
    this.fromId = '',
    this.fromName = '',
    this.fromImage = '',
    this.type = '',
    this.eventId = '',
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"] ?? '',
    title: json["title"] ?? '',
    content: json["content"] ?? '',
    senderId: json["senderId"] ?? '',
    senderName: json["senderName"] ?? '',
    senderImage: json["senderImage"] ?? '',
    isRead: json["isRead"] ?? '',
    fromId: json["fromId"] ?? '',
    fromName: json["fromName"] ?? '',
    fromImage: json["fromImage"] ?? '',
    type: json["type"] ?? '',
    eventId: json["eventId"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "senderId": senderId,
    "senderName": senderName,
    "senderImage": senderImage,
    "isRead": isRead,
    "fromId": fromId,
    "fromName": fromName,
    "fromImage": fromImage,
    "type": type,
    "eventId": eventId,
  };
}