import 'package:add/constants/constant_sizedbox.dart';
import 'package:add/pages/track_your_order/functions/contact_to_artist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.artName,
    required this.orderDate,
    required this.price,
    required this.artistEmail,
    required this.orderStatus,
  });
  final String artName;
  final Timestamp orderDate;
  final String price;
  final String artistEmail;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    final day = orderDate.toDate().day;
    final month = orderDate.toDate().month;
    final year = orderDate.toDate().year;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xffeaefff),
          width: 1,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            artName,
            style: TextStyle(
              color: Color(0xff223263),
              fontSize: 14,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w700,
              letterSpacing: 0.50,
            ),
          ),
          Opacity(
            opacity: 0.50,
            child: Text(
              "Order at :  $day-$month-$year",
              style: const TextStyle(
                color: Color(0xff223263),
                fontSize: 12,
                letterSpacing: 0.50,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 22,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Opacity(
                  opacity: 0.50,
                  child: Text(
                    "Order Status",
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.40),
                Expanded(
                  child: Text(
                    orderStatus,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 22,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Opacity(
                  opacity: 0.50,
                  child: Text(
                    "Chat with Artist",
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.54),
                Expanded(
                  child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        ContactArtist.openWhatsapp('9633005917');
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 22,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Opacity(
                  opacity: 0.50,
                  child: Text(
                    "Mail to Artist",
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.57),
                Expanded(
                  child: IconButton(
                      // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
                      icon: const FaIcon(
                        FontAwesomeIcons.g,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        ContactArtist.mailTo(artistEmail);
                      }),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
