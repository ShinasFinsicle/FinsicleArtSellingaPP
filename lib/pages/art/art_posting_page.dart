import 'dart:io';

import 'package:add/constants/constant_colors.dart';
import 'package:add/functions/alert_popup.dart';
import 'package:add/functions/validate.dart';
import 'package:add/widgets/buttons/my_button.dart';
import 'package:add/widgets/posting_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/artimage_galllery_provider.dart';

class ArtPostingPage extends StatelessWidget {
  ArtPostingPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<ArtImageGallery>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: const Text("Sell Your Art"),
        ),
        body: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PostingTextform(
                    headLineText: 'Art Name',
                    textController: value.artNameController,
                    hintText: 'Art Name',
                    validator: (value) => validatefields(value),
                  ),
                  PostingTextform(
                    maxLines: 7,
                    headLineText: "Add Description",
                    textController: value.descriptionController,
                    hintText: "Add Description",
                    validator: (value) => validatefields(value),
                  ),
                  PostingTextform(
                    prefixIcon: Icons.currency_rupee,
                    headLineText: "Enter Price of the Art",
                    hintText: "Enter Price of the Art",
                    textInputType: TextInputType.number,
                    textController: value.priceController,
                    validator: (value) => validatefields(value),
                  ),
                  value.imageFileList.isNotEmpty
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: value.imageFileList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                    File(value.imageFileList[index].path)),
                              ))
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Mybutton(
                      label: value.imageFileList.isEmpty
                          ? "Upload images"
                          : "Upload More Images",
                      ontap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.thumb_up, color: Colors.white),
                                SizedBox(width: 10),
                                Text('Great job!',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                        );
                      },
                      // ontap: () => value.getSelectedImages(),
                      buttonColor: kPrimaryTextcolor,
                    ),
                  ),
                  !value.uploading
                      ? Mybutton(
                          label: 'Post',
                          ontap: () async {
                            if (_formKey.currentState!.validate()) {
                              if (value.imageFileList.isEmpty) {
                                alertPopup(
                                    color: Colors.red,
                                    messgae: "Please Upload Image");
                              } else {
                                value.uploadchanger();
                                await value.uploadArtdetailstoFirebase();
                                value.artNameController.clear();
                                value.descriptionController.clear();
                                value.priceController.clear();
                                value.imageFileList.clear();
                                value.imgUrls.clear();
                                value.clearImage();
                                value.uploadchanger();
                              }
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
            ),
          ],
        ),
      ),
    );
  }
}
