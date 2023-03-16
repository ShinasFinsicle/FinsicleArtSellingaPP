import 'package:add/provider/art/art_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/drawer/divider.dart';

class TotalPriceTile extends StatelessWidget {
  const TotalPriceTile({super.key});
  final int shippingCost = 40;

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtDetailsProvider>(
      builder: (context, value, child) => Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 190,
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 22,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Items",
                    style: TextStyle(
                      color: Color(0xff9098b1),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                  Expanded(
                    child: Text(
                      "1",
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
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
            SizedBox(height: 11.75),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 22,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Shipping",
                    style: TextStyle(
                      color: Color(0xff9098b1),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                  Expanded(
                    child: Text(
                      "₹ ${value.artModels!.shippingCost}",
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
            const SizedBox(height: 11.75),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 22,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Art Price",
                    style: TextStyle(
                      color: Color(0xff9098b1),
                      fontSize: 12,
                      letterSpacing: 0.50,
                    ),
                  ),
                  SizedBox(width: 163),
                  Expanded(
                    child: Text(
                      "₹ ${value.artModels!.artPrice}",
                      overflow: TextOverflow.ellipsis,
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
            const SizedBox(height: 11.75),
            dividerWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 18,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Total Price",
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.50,
                    ),
                  ),
                  const SizedBox(width: 188),
                  Expanded(
                    child: Text(
                      "₹ ${int.parse(value.artModels!.artPrice) + int.parse(value.artModels!.shippingCost)}",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xff40bfff),
                        fontSize: 12,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
