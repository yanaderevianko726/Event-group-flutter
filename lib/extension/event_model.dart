import 'package:popuppros/models/model.dart';

extension EEventModel on EventModel {
  String get fullName {
    return '${firstName ?? ''} ${lastName ?? ''}';
  }
}
