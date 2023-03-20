import 'package:add/constants/constant_colors.dart';
import 'package:add/widgets/buttons/coustom_elevated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../provider/status/statusupdate_provider.dart';

class StatusUpdater extends StatelessWidget {
  const StatusUpdater({super.key, required this.artId});
  final String artId;
  @override
  Widget build(BuildContext context) {
    return Consumer<StatusUpdateProvider>(
      builder: (context, value1, child) => Column(
        children: [
          Row(
            children: [
              Radio<String>(
                  value: 'Not Packed',
                  groupValue: value1.selectedStatus,
                  onChanged: (value) => value1.onChanger(value)),
              const Text(
                'Not Packed',
                style: TextStyle(color: kPrimaryTextcolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                  value: 'Packed',
                  groupValue: value1.selectedStatus,
                  onChanged: (value) => value1.onChanger(value)),
              const Text(
                'Packed',
                style: TextStyle(color: kPrimaryTextcolor),
              ),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                  value: 'Shipped',
                  groupValue: value1.selectedStatus,
                  onChanged: (value) => value1.onChanger(value)),
              const Text(
                'Shipped',
                style: TextStyle(color: kPrimaryTextcolor),
              ),
            ],
          ),
          CoustomElevatedButoon(
              label: "Update",
              ontap: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('art')
                      .doc(artId)
                      .update({'Shipment': value1.selectedStatus});
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              backGroundColor: kPrimaryTextcolor)
        ],
      ),
    );
  }
}
