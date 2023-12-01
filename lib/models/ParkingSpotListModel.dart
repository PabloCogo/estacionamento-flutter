import 'package:projeto_final_flutter/models/ParkingSpotModel.dart';

class ParkingSpotListModel {
  final List<ParkingSpotModel> listParkingSpotModel;

  ParkingSpotListModel(this.listParkingSpotModel);

  ParkingSpotListModel.fromJson(List<dynamic> json)
      : listParkingSpotModel = List.from(json)
            .map((item) => ParkingSpotModel.fromJson(item))
            .toList();
}
