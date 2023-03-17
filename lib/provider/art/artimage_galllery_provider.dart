import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArtImageGallery extends ChangeNotifier {
  bool uploading = false;
  final TextEditingController artNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController shipppingpPiceController =
      TextEditingController();
  final picker = ImagePicker();
  List<XFile> imageFileList = [];
  final user = FirebaseAuth.instance.currentUser!;
  List<String> imgUrls = [];
  void getSelectedImages() async {
    final List<XFile> selectedImages = await picker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    notifyListeners();
  }

  uploadchanger() {
    uploading = !uploading;
    notifyListeners();
  }

  clearImage() {
    // imageFileList.clear();
    notifyListeners();
  }

  Future<String> uploadFile(XFile img) async {
    String artName = 'artName${DateTime.now().microsecondsSinceEpoch}';
    final ref =
        FirebaseStorage.instance.ref().child('ArtImages').child(artName);
    await ref.putFile(File(img.path));
    String imgurl = await ref.getDownloadURL();
    print(imgurl);
    return imgurl;
  }

  Future<List<String>> uploadMutipleFile(List<XFile> imgs) async {
    for (int i = 0; i < imgs.length; i++) {
      var imgUrl = await uploadFile(imgs[i]);
      imgUrls.add(imgUrl.toString());
      print(imgUrls[i]);
    }
    return imgUrls;
  }

  Future<void> uploadArtdetailstoFirebase() async {
    try {
      await uploadMutipleFile(imageFileList);
      final artId = const Uuid().v4();
      await FirebaseFirestore.instance.collection('art').doc(artId).set(({
            'ArtName': artNameController.text,
            'ArtId': artId,
            'ArtDescription': descriptionController.text,
            'ArtPrice': priceController.text,
            'ArtAdmin': user.uid,
            'ArtImages': imgUrls,
            'sold': false,
            'ArtistEmail': user.email,
            'buyerUid': 'addbuyeruid',
            'uploadedat': Timestamp.now(),
            'ShippingCost': shipppingpPiceController.text
          }));
    } catch (e) {
      print(e);
    }
  }
}
