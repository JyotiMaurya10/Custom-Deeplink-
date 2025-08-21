import 'package:deeplink/model/phone_detail_model.dart';

class PhoneModel {
  final String id;
  final String name;
  final PhoneDetail? phoneDetail;

  PhoneModel({required this.id, required this.name, this.phoneDetail});

  factory PhoneModel.fromJson(Map<String, dynamic> json) {
    return PhoneModel(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      phoneDetail: json['data'] != null ? PhoneDetail.fromJson(json['data']) : null,
    );
  }
}
