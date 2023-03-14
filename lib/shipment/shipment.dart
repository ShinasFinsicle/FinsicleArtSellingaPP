import 'package:add/constants/constant_colors.dart';
import 'package:add/pages/user/address/adress.dart';
import 'package:add/shipment/widgets/address_tile.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Shipment extends StatelessWidget {
  const Shipment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shi To"),
        actions: [
          IconButton(
            color: kBackgroundcolor,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Address()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: AddressTile()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Mybutton(label: "Next", ontap: () {}),
          )
        ],
      ),
    );
  }
}
