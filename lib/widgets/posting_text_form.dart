import 'package:add/constants/constant_colors.dart';
import 'package:flutter/material.dart';

class PostingTextform extends StatelessWidget {
  const PostingTextform(
      {super.key,
      required this.textController,
      required this.headLineText,
      this.maxLines = 1,
      required this.hintText,
      required this.validator,
      this.enabled = true,
      this.textInputType = TextInputType.name,
      this.prefixIcon});

  final TextEditingController textController;
  final String hintText;
  final String headLineText;
  final int maxLines;
  final Function validator;
  final bool enabled;
  final TextInputType textInputType;
  final IconData? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headLineText,
            style: const TextStyle(
                fontSize: 14,
                fontFamily: ('Poppins'),
                color: kPrimaryTextcolor),
          ),
          const SizedBox(height: 15.78),
          TextFormField(
            keyboardType: textInputType,
            enabled: enabled,
            validator: (value) => validator(value),
            maxLines: maxLines,
            style: const TextStyle(color: kPrimaryTextcolor),
            cursorColor: kPrimaryTextcolor,
            controller: textController,
            decoration: InputDecoration(
                prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
                prefixIconColor: kPrimaryTextcolor,
                hintText: hintText,
                hintStyle:
                    const TextStyle(fontSize: 12, fontFamily: ('Poppins')),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryTextcolor)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffd1d6e7),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)))),
          )
        ],
      ),
    );
  }
}
