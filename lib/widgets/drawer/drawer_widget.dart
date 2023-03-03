import 'package:add/pages/adminpage/art_posting_page.dart';
import 'package:add/widgets/drawer/drawer_Items_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account"),
      ),
      body: ListView(
        children: [
          DrawerItemsWidget(
            icon: const Icon(Icons.person),
            title: "Profile",
            ontap: () {
              print("1");
            },
          ),
          DrawerItemsWidget(
              icon: const Icon(Icons.sell),
              title: "Sell Yout Art",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ArtPostingPage()),
                );
              }),
          DrawerItemsWidget(
              icon: const Icon(Icons.sim_card_download_sharp),
              title: "Received Orders",
              ontap: () {})
        ],
      ),
    );
  }
}
