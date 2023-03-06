import 'package:add/constants/text.dart/colors.dart';
import 'package:flutter/material.dart';

showAlerttoUser(context, label, {Function()? onpressed}) => showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(color: kPrimaryTextcolor),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: onpressed,
              child: const Text(
                'Yes ',
                style: TextStyle(color: kPrimaryTextcolor),
              )),
          TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: const Text(
                'No ',
                style: TextStyle(color: kPrimaryTextcolor),
              ))
        ],
      );
    });
