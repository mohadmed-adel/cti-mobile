import 'services_model.dart';

class RequestedServiceModel {
  final int? id;
  final String? description;
  final String? location;
  final String? buildingName;
  final String? buildingNumber;
  final String? assetNumber;
  final String? serviceId;
  final String? error;
  final int? userId;
  final ServicesModel? services;
  final String? createdAt;
  final String? status;
  String? attachment;
  RequestedServiceModel({
    this.id,
    this.description,
    this.location,
    this.assetNumber,
    this.buildingName,
    this.buildingNumber,
    this.serviceId,
    this.userId,
    this.services,
    this.createdAt,
    this.status,
    this.error,
    this.attachment,
  });

  factory RequestedServiceModel.fromJson(Map<String, dynamic> json) {
    return RequestedServiceModel(
      id: json['id'],
      description: json['description'],
      location: json['location'],
      buildingName: json['building_name'],
      buildingNumber: json['building_number'],
      createdAt: json['created_at'],
      assetNumber: json['asset_number'],
      status: json['status'] == null ? null : json['status']['name'],
      attachment: json['attachment'],
      services: ServicesModel.fromJson(json['service']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "description": description,
      "location": location,
      "building_name": buildingName,
      "building_number": buildingNumber,
      "asset_number": assetNumber,
      "service_id": serviceId,
    };
  }
}
