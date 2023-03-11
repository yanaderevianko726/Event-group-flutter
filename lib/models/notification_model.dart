
class NotificationModel {
  String? id;
  String? title;
  String? content;
  String? senderId;
  String? senderName;
  String? senderImage;
  String? isRead;
  String? fromType; // Vendor or Event
  String? fromId; // VendorId or EventId
  String? toType; // Vendor or Event
  String? toId; // VendorId or EventId
  String? slotIndex;

  NotificationModel({
    this.id = '',
    this.title = '',
    this.content = '',
    this.senderId = '',
    this.senderName = '',
    this.senderImage = '',
    this.isRead = 'Not',
    this.fromType = '',
    this.fromId = '',
    this.toType = '',
    this.toId = '',
    this.slotIndex = '0',
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"] ?? '',
    title: json["title"] ?? '',
    content: json["content"] ?? '',
    senderId: json["senderId"] ?? '',
    senderName: json["senderName"] ?? '',
    senderImage: json["senderImage"] ?? '',
    isRead: json["isRead"] ?? '',
    fromType: json["fromType"] ?? '',
    fromId: json["fromId"] ?? '',
    toType: json["toType"] ?? '',
    toId: json["toId"] ?? '',
    slotIndex: json["slotIndex"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "content": content,
    "senderId": senderId,
    "senderName": senderName,
    "senderImage": senderImage,
    "isRead": isRead,
    "fromType": fromType,
    "fromId": fromId,
    "toType": toType,
    "toId": toId,
    "slotIndex": slotIndex,
  };
}