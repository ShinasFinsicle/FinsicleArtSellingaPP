import 'package:add/pages/art/art_posting_page.dart';
import 'package:add/widgets/drawer/drawer_Items_widget.dart';
import 'package:flutter/material.dart';

import '../../pages/user/user_profile.dart';

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
          DrawerItemsWidget(
              icon: const Icon(Icons.sell),
              title: "Sell Yout Art",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArtPostingPage()),
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
