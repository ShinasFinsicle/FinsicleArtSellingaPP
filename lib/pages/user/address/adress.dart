import 'package:add/constants/constant_colors.dart';
import 'package:add/functions/validate.dart';
import 'package:add/provider/user/address_provider.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:add/widgets/posting_text_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../../functions/alert_popup.dart';

class Address extends StatelessWidget {
  Address({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipment address"),
      ),
      body: Consumer<AddressProvider>(
        builder: (context, value, child) => Form(
          key: _formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  PostingTextform(
                      textController: value.nameController,
                      headLineText: "Full name",
                      hintText: "Full name*",
                      validator: (value) => validatefields(value)),
                  PostingTextform(
                      textInputType: TextInputType.phone,
                      textController: value.phoneNumberController,
                      headLineText: "Phone Number",
                      hintText: "Phone Number*",
                      validator: (value) => phoneValidator(value)),
                  PostingTextform(
                      textInputType: TextInputType.phone,
                      textController: value.pincodeController,
                      headLineText: "Pincode",
                      hintText: "Pincode*",
                      validator: (value) => validatefields(value)),
                  PostingTextform(
                      textController: value.stateController,
                      headLineText: "State",
                      hintText: "State*",
                      validator: (value) => validatefields(value)),
                  PostingTextform(
                      textController: value.cityController,
                      headLineText: "City",
                      hintText: "City*",
                      validator: (value) => validatefields(value)),
                  PostingTextform(
                      textController: value.buildingNameController,
                      headLineText: "Building Name",
                      hintText: "House No.,Building Name*",
                      validator: (value) => validatefields(value)),
                  !value.uploading
                      ? Mybutton(
                          label: "Save Address",
                          ontap: () async {
                            if (_formKey.currentState!.validate()) {
                              value.uploadchanger();
                              await value.uploadUserdetailstoFirebase();
                              value.clear();
                              value.uploadchanger();
                              // ignore: use_build_context_synchronously
                              AlertPopup.alertPopup(context,
                                  message: "Added Sucessfully",
                                  color: Colors.green,
                                  icon: Icons.thumb_up_sharp);
                            } else {}
                          })
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: kPrimaryTextcolor,
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
