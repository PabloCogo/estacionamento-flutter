import 'package:flutter/material.dart';
import 'package:projeto_final_flutter/views/_create.dart';
import 'package:projeto_final_flutter/views/_home.dart';
import 'package:projeto_final_flutter/views/_list.dart';

Widget buildMenu(BuildContext context) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        buildUserAccountsDrawerHeader(),
        buildListTile(
          title: 'Home',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        buildListTile(
          title: 'Vagas criadas',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ListParkingSpots()),
            );
          },
        ),
        buildListTile(
          title: 'Nova vaga',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Create()),
            );
          },
        ),
      ],
    ),
  );
}

UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
  return UserAccountsDrawerHeader(
    accountName: const Text("teste"),
    accountEmail: const Text("teste@teste.com.br"),
    currentAccountPicture: CircleAvatar(
      backgroundColor: Colors.white,
      child: Image.network(
        'https://cdn-icons-png.flaticon.com/512/741/741407.png',
      ),
    ),
  );
}

ListTile buildListTile({
  required String title,
  required VoidCallback onTap,
}) {
  return ListTile(
    title: Text(title),
    onTap: onTap,
  );
}
