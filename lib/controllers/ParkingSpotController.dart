import 'package:get/get.dart';
import 'package:projeto_final_flutter/models/ParkingSpotModel.dart';
import 'package:projeto_final_flutter/services/ParkingSpotService.dart';

class ParkingSpotController extends GetxController {
  ParkingSpotService parkingSpotService = ParkingSpotService();
  var isLoading = false.obs;
  var listParkingSpotObs = <ParkingSpotModel>[].obs;

  static ParkingSpotController get parkingSpotController => Get.find();

  Future<dynamic> listParkingSpot() async {
    try {
      isLoading.value = true;
    } catch (erro) {
      isLoading.value = false;
    } finally {
      var list = await parkingSpotService.listParkingSpots();
      listParkingSpotObs.value = list.listParkingSpotModel;
      isLoading.value = false;
      update();
    }
    return listParkingSpotObs;
  }

  Future<dynamic> newParkingSpot(ParkingSpotModel objeto) async {
    try {
      isLoading.value = true;
      var response = await parkingSpotService.newParkingSpot(objeto);
      isLoading.value = false;
      update();
      return response;
    } catch (erro) {
      return false;
    }
  }

  Future<dynamic> editParkingSpot(ParkingSpotModel objeto) async {
    try {
      isLoading.value = true;
      var response = await parkingSpotService.editParkingSpot(objeto);
      isLoading.value = false;
      update();
      return response;
    } catch (erro) {
      return false;
    }
  }

  Future<dynamic> deleteParkingSpot(ParkingSpotModel objeto) async {
    try {
      isLoading.value = true;
      var response = await parkingSpotService.deleteParkingSpot(objeto);
      isLoading.value = false;
      update();
      return response;
    } catch (erro) {
      return false;
    }
  }
}
