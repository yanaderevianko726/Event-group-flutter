
import 'package:firebase_database/firebase_database.dart';

class VendorModel {
  String? vendorId;
  String? vendorName;
  String? image;
  String? vendorType;
  String? location;
  String? lat;
  String? lang;
  String? radius;
  String? status;
  String? tentSlot;
  String? serviceDescription;

  VendorModel({
    this.vendorId = '',
    this.vendorName = '',
    this.image = '',
    this.vendorType = '',
    this.location = '',
    this.lat = '',
    this.lang = '',
    this.radius = '',
    this.status = '',
    this.tentSlot = '',
    this.serviceDescription = '',
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    vendorId: json["vendorId"] ?? '',
    vendorName: json["vendorName"] ?? '',
    image: json["image"] ?? '',
    vendorType: json["vendorType"] ?? '',
    location: json["location"] ?? '',
    lat: json["lat"] ?? '',
    lang: json["lang"] ?? '',
    radius: json["radius"] ?? '',
    status: json["status"] ?? '',
    tentSlot: json["tentSlot"] ?? '',
    serviceDescription: json["serviceDescription"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "vendorId": vendorId,
    "vendorName": vendorName,
    "image": image,
    "vendorType": vendorType,
    "location": location,
    "lat": lat,
    "lang": lang,
    "radius": radius,
    "status": status,
    "tentSlot": tentSlot,
    "serviceDescription": serviceDescription,
  };
}

