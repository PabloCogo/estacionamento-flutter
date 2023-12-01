import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/components/_header.dart';
import 'package:projeto_final_flutter/components/_menu.dart';
import 'package:projeto_final_flutter/models/ParkingSpotModel.dart';
import '_form.dart';

class Edit extends StatelessWidget {
  final ParkingSpotModel objeto;

  const Edit({Key? key, required this.objeto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: "Editar vaga",
      ),
      drawer: buildMenu(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ParkingSpotForm(initialData: objeto, isEditing: true),
        ),
      ),
    );
  }
}
