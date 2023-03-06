import 'package:add/functions/validate.dart';
import 'package:add/widgets/buttons/button_widget.dart';
import 'package:add/widgets/posting_textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neumorphic_button/neumorphic_button.dart';

import '../../widgets/image_picker_widget.dart';

class ArtPostingPage extends StatelessWidget {
  ArtPostingPage({super.key});
  final TextEditingController _galleryController = TextEditingController();
  final TextEditingController _artNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              PostingTextform(
                headLineText: 'Art Name',
                textController: _artNameController,
                hintText: 'Art Name',
                validator: (value) => validatefields(value),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const ImagePickerWidget());
                },
                child: PostingTextform(
                  enabled: false,
                  hintText: 'Choose Photos from Gallery',
                  textController: _galleryController,
                  headLineText: 'Add Photos',
                  validator: (value) => validatefields(value),
                ),
              ),
              PostingTextform(
                maxLines: 7,
                headLineText: "Add Description",
                textController: _descriptionController,
                hintText: "Add Description",
                validator: (value) => validatefields(value),
              ),
              PostingTextform(
                headLineText: "Enter Price of the Art",
                hintText: "Enter Price of the Art",
                textController: _priceController,
                validator: (value) => validatefields(value),
              ),
              Mybutton(
                  label: 'Post Now',
                  ontap: () async {
                    User? user = FirebaseAuth.instance.currentUser;
                    final adminUid = user!.uid;
                    if (_formKey.currentState!.validate()) {
                      try {
                        await FirebaseFirestore.instance
                            .collection('art')
                            .doc()
                            .set(({
                              'ArtName': _artNameController.text,
                              'ArtDescription': _artNameController.text,
                              'ArtPrice': _priceController.text,
                              'ArtAdmin': adminUid,
                            }));
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      print("NOt ok");
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
