import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/components/_header.dart';
import 'package:projeto_final_flutter/components/_menu.dart';
import '_form.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: "Criar vaga",
      ),
      drawer: buildMenu(context),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ParkingSpotForm(),
        ),
      ),
    );
  }
}
