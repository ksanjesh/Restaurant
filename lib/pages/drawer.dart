import 'package:flutter/material.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text("sanjesh"),
            accountEmail: Text("sanjesh163@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/01/20/13/28/woman-1151562__340.jpg"),
          ),
          )
        ],
      ),
    );
  }
}
