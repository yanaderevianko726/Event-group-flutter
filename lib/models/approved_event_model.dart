import 'package:popuppros/models/event_model.dart';

class ApprovedEventModel {
  String? selTentIndex;
  EventModel? eventModel;

  ApprovedEventModel({
    this.selTentIndex = '0',
    required this.eventModel,
  });
}