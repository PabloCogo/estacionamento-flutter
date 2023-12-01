import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_final_flutter/components/_header.dart';
import 'package:projeto_final_flutter/components/_menu.dart';
import 'package:projeto_final_flutter/controllers/ParkingSpotController.dart';
import 'package:projeto_final_flutter/views/_edit.dart';

class ListParkingSpots extends StatefulWidget {
  const ListParkingSpots({Key? key}) : super(key: key);

  @override
  State<ListParkingSpots> createState() => _ListParkingSpotsState();
}

class _ListParkingSpotsState extends State<ListParkingSpots> {
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: "Vagas",
      ),
      drawer: buildMenu(context),
      body: Obx(() => controller.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: controller.listParkingSpotObs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title:
                          Text(controller.listParkingSpotObs[index].modelCar),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Get.to(Edit(
                                  objeto:
                                      controller.listParkingSpotObs[index]));
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              if (mounted) {
                                var response =
                                    await controller.deleteParkingSpot(
                                        controller.listParkingSpotObs[index]);
                                if (response != false) {
                                  Get.snackbar(
                                      "Sucesso", "Deletado com sucesso");
                                  await controller.listParkingSpot();
                                } else {
                                  Get.snackbar("Erro", "Erro ao deletar");
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
    );
  }
}
