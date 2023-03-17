import 'package:flutter/material.dart';

class ArtDetailsProvider extends ChangeNotifier {
  ArtModel? artModels;
  setArtModel(ArtModel value) {
    artModels = ArtModel(
      artName: value.artName,
      artAdminUid: value.artAdminUid,
      artDescription: value.artDescription,
      artImages: value.artImages,
      artPrice: value.artPrice,
      shippingCost: value.shippingCost,
      artId: value.artId,
    );
    notifyListeners();
  }
}

class ArtModel {
  final String artName;
  final String artAdminUid;
  final String artDescription;
  final String artPrice;
  final String shippingCost;
  final List artImages;
  final String artId;
  ArtModel(
      {required this.artId,
      required this.shippingCost,
      required this.artAdminUid,
      required this.artDescription,
      required this.artPrice,
      required this.artImages,
      required this.artName});
}
