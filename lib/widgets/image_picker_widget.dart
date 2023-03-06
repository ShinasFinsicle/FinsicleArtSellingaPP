import 'dart:ffi';
import 'dart:io';

import 'package:add/constants/text.dart/colors.dart';
import 'package:add/widgets/buttons/coustom_elevatedbutton.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

File? _image;
bool _uploading = false;
final picker = ImagePicker();

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No images Selected");
      }
    });
  }

  // Future<String> uploadfile() async {
  //   File file = File(_image.path);
  //   String artName = 'artName/${DateTime.now().microsecondsSinceEpoch}';
  //   String downloadUrl;
  //   try {
  //     await FirebaseStorage.instance.ref(artName).putFile(file);
  //     downloadUrl = await FirebaseStorage.instance
  //         .ref(artName)
  //         .child('ArtImages')
  //         .getDownloadURL();
  //     if (downloadUrl != null) {
  //       setState(() {
  //         _image = null;
  //       });
  //     }
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   }
  //   return downloadUrl;
  // }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            title: const Text("Upload Images"),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    if (_image != null)
                      Positioned(
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _image = null;
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: kPrimaryTextcolor,
                              ))),
                    SizedBox(
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      child: FittedBox(
                          child: _image == null
                              ? const Icon(
                                  Icons.photo_library_sharp,
                                  color: Colors.grey,
                                )
                              : Image.file(_image!)),
                    ),
                  ],
                ),
              ),
              if (_image != null)
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CoustomElevatedButoon(
                            label: "Save",
                            ontap: () {},
                            backGroundColor: Colors.green),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CoustomElevatedButoon(
                            label: "Cancel",
                            ontap: () {},
                            backGroundColor: Colors.red),
                      ),
                    )
                  ],
                ),
              CoustomElevatedButoon(
                  label: 'Upload Image',
                  ontap: () {
                    getImage();
                  },
                  backGroundColor: kPrimaryTextcolor)
            ],
          )
        ],
      ),
    );
  }
}
