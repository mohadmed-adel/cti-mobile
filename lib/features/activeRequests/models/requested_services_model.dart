import '../../services/services-list/models/services_model.dart';

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
  RequestedServiceModel(
      {this.id,
      this.description,
      this.location,
      this.assetNumber,
      this.buildingName,
      this.buildingNumber,
      this.serviceId,
      this.userId,
      this.services,
      this.error});

  factory RequestedServiceModel.fromJson(Map<String, dynamic> json) {
    return RequestedServiceModel(
        id: json['id'],
        description: json['description'],
        location: json['location'],
        buildingName: json['building_name'],
        buildingNumber: json['building_number'],
        services: ServicesModel.fromJson(json['service']));
  }
  Map<String, dynamic> toJson(RequestedServiceModel requestedServiceModel) {
    return {
      "description": requestedServiceModel.description,
      "location": requestedServiceModel.location,
      "building_name": requestedServiceModel.buildingName,
      "building_number": requestedServiceModel.buildingNumber,
      "asset_number": requestedServiceModel.assetNumber,
      "service_id": requestedServiceModel.serviceId,
    };
  }
}
