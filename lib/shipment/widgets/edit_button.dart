import 'package:add/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 125,
        height: 57,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3d40bfff),
                      blurRadius: 30,
                      offset: Offset(0, 10),
                    ),
                  ],
                  color: kBackgroundcolor),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Opacity(
              opacity: 0.50,
              child: Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
