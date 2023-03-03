import 'package:add/constants/text.dart/colors.dart';
import 'package:add/widgets/arttlie_widget.dart';
import 'package:add/widgets/drawer/drawer_widget.dart';
import 'package:flutter/material.dart';

class ArtlistScreen extends StatelessWidget {
  const ArtlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text(
            "Welcome Shinas",
            style: TextStyle(
                color: kPrimaryTextcolor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: ('Poppins')),
          ),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(4.0), // set the height of the bottom bar
            child: Container(
              width: double.infinity,
              height: 2.0,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                        Colors.white10, // set the color of the underline here
                    width: 0.5, // set the width of the underline here
                  ),
                ),
              ),
            ),
          ),
        )

        // appBar: AppBar(
        //   actions: [
        //     IconButton(
        //         onPressed: () {
        //           final provider =
        //               Provider.of<GoogleSignProvider>(context, listen: false);
        //           provider.logout();
        //         },
        //         icon: const Icon(
        //           Icons.logout,
        //           color: kPrimaryTextcolor,
        //         ))
        //   ],
        //   title: const Text(
        //     "Welcome Shinas",
        //     style: TextStyle(
        //         color: kPrimaryTextcolor,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: ('Poppins')),
        //   ),
        // ),

        ,
        body: GridView.builder(
            itemCount: 11,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (context, index) {
              return const ArttileWidget();
            }));
  }
}
