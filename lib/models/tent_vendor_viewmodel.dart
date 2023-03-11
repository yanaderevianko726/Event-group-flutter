import 'package:popuppros/models/model.dart';

class TentVendorViewModel {
  int? tentIndex;
  int? selVendorIndex;
  List<VendorModel> vendors = [];

  TentVendorViewModel({
    this.tentIndex = 0,
    this.selVendorIndex = 0,
    required this.vendors,
  });
}