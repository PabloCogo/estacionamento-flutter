import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projeto_final_flutter/models/ParkingSpotListModel.dart';
import 'package:projeto_final_flutter/models/ParkingSpotModel.dart';

class ParkingSpotService {
  static const String baseUrl =
      "https://parking-spot-238adfbb7467.herokuapp.com";
  static const String urlList = "$baseUrl/parking-spot/list";
  static const String urlSave = "$baseUrl/parking-spot/save";
  static const String urlEdit = "$baseUrl/parking-spot/edit";
  static const String urlDelete = "$baseUrl/parking-spot/delete";

  dynamic _response;
  ParkingSpotService() {
    _response = "";
  }

  Future<ParkingSpotListModel> listParkingSpots() async {
    _response = await http.get(Uri.parse(urlList));
    if (_response.statusCode == 200) {
      List<dynamic> list = json.decode(_response.body);
      return ParkingSpotListModel.fromJson(list);
    } else {
      throw Exception("Erro ao obter os registros da API.");
    }
  }

  Future<dynamic> newParkingSpot(ParkingSpotModel parkingSpotModel) async {
    _response = await http.post(Uri.parse(urlSave),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: json.encode(parkingSpotModel.toJson()));

    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      throw Exception("Erro ao criar o registro.");
    }
  }

  Future<dynamic> editParkingSpot(ParkingSpotModel parkingSpotModel) async {
    _response = await http.post(Uri.parse(urlEdit),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
        },
        body: json.encode(parkingSpotModel.toJson()));

    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return _response.body;
    } else {
      throw Exception("Erro ao editar o registro.");
    }
  }

  Future<bool> deleteParkingSpot(ParkingSpotModel parkingSpotModel) async {
    String urlComplete = "$urlDelete/${parkingSpotModel.id.toString()}";
    _response = await http.post(Uri.parse(urlComplete));
    return _response.statusCode == 200;
  }
}
