import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:projeto_final_flutter/controllers/ParkingSpotController.dart';
import 'package:projeto_final_flutter/models/ParkingSpotModel.dart';

class ParkingSpotForm extends StatefulWidget {
  final ParkingSpotModel? initialData;
  final bool isEditing;

  const ParkingSpotForm({
    Key? key,
    this.initialData,
    this.isEditing = false,
  }) : super(key: key);

  @override
  State<ParkingSpotForm> createState() => _ParkingSpotFormState();
}

class _ParkingSpotFormState extends State<ParkingSpotForm> {
  final _formKey = GlobalKey<FormState>();
  final _parkingSpotNumberController = TextEditingController();
  final _licensePlateCarController = TextEditingController();
  final _brandCarController = TextEditingController();
  final _modelCarController = TextEditingController();
  final _colorCarController = TextEditingController();
  final _responsibleNameController = TextEditingController();
  final _apartmentController = TextEditingController();
  final _blockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialData != null && widget.isEditing) {
      final initialData = widget.initialData!;
      _parkingSpotNumberController.text = initialData.parkingSpotNumber;
      _licensePlateCarController.text = initialData.licensePlateCar;
      _brandCarController.text = initialData.brandCar;
      _modelCarController.text = initialData.modelCar;
      _colorCarController.text = initialData.colorCar;
      _responsibleNameController.text = initialData.responsibleName;
      _apartmentController.text = initialData.apartment;
      _blockController.text = initialData.block;
    }
  }

  String? validateFormField(String value) {
    if (value.isEmpty) {
      return 'Por favor, digite alguma informação';
    }
    return null;
  }

  void handleSubmit() async {
    final parkingSpot = ParkingSpotModel(
      widget.isEditing ? widget.initialData?.id ?? "" : "",
      _parkingSpotNumberController.text,
      _licensePlateCarController.text,
      _brandCarController.text,
      _modelCarController.text,
      _colorCarController.text,
      "",
      _responsibleNameController.text,
      _apartmentController.text,
      _blockController.text,
    );

    final response = widget.isEditing
        ? await ParkingSpotController.parkingSpotController
            .editParkingSpot(parkingSpot)
        : await ParkingSpotController.parkingSpotController
            .newParkingSpot(parkingSpot);

    if (response != false) {
      Get.snackbar(
        "Sucesso",
        widget.isEditing ? "Editado com Sucesso" : "Criado com Sucesso",
        icon: const Icon(Icons.check, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.lightGreen,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        "Houve um erro",
        widget.isEditing ? "Erro ao editar" : "Erro ao criar",
        icon: const Icon(Icons.error, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildInput(
                  labelText: 'Número da Vaga',
                  controller: _parkingSpotNumberController,
                  icon: Icons.confirmation_number,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Placa do Carro',
                  controller: _licensePlateCarController,
                  icon: Icons.directions_car,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Marca do Carro',
                  controller: _brandCarController,
                  icon: Icons.car_rental,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Modelo do Carro',
                  controller: _modelCarController,
                  icon: Icons.car_rental,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Cor do Carro',
                  controller: _colorCarController,
                  icon: Icons.color_lens,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Responsável',
                  controller: _responsibleNameController,
                  icon: Icons.person,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Apartamento',
                  controller: _apartmentController,
                  icon: Icons.apartment,
                ),
                const SizedBox(height: 16.0),
                _buildInput(
                  labelText: 'Bloco',
                  controller: _blockController,
                  icon: Icons.business,
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: EdgeInsets.symmetric(
                        vertical:
                            16.0), // Ajuste este valor conforme necessário
                  ),
                  onPressed: handleSubmit,
                  child: Text('Enviar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInput({
    required String labelText,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
      validator: (value) => validateFormField(value!),
      controller: controller,
    );
  }
}
