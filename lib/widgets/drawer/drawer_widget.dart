import 'package:add/info_text/privacy_screen.dart';
import 'package:add/info_text/terms_screen.dart';
import 'package:add/pages/art/art_posting_page.dart';
import 'package:add/pages/track_your_order/track_your_order.dart';
import 'package:add/widgets/drawer/drawer_Items_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../pages/admin/admin_uid.dart';
import '../../pages/receivedorders/received_orders.dart';
import '../../pages/user/profile.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  final _user = FirebaseAuth.instance.currentUser!;
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          _user.uid == adminUid
              ? DrawerItemsWidget(
                  icon: const Icon(Icons.sell),
                  title: "Sell Yout Art",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ArtPostingPage()),
                    );
                  })
              : Container(),
          _user.uid == adminUid
              ? DrawerItemsWidget(
                  icon: const Icon(Icons.sim_card_download_sharp),
                  title: "Received Orders",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReceivedOrders()),
                    );
                  })
              : Container(),
          _user.uid == adminUid
              ? Container()
              : DrawerItemsWidget(
                  icon: const Icon(Icons.directions_bike),
                  title: "Track Your Orders",
                  ontap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrackYourOrder()),
                    );
                  }),
          DrawerItemsWidget(
              icon: const Icon(Icons.policy),
              title: "Privacy Policy",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyScreen()),
                );
              }),
          DrawerItemsWidget(
              icon: const Icon(Icons.auto_stories),
              title: "Terms & conditions",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsScreen()),
                );
              }),
        ],
      ),
    );
  }
}
