import 'package:fluttertoast/fluttertoast.dart';

alertPopup({required color, required String messgae}) async {
  await Fluttertoast.showToast(
      msg: messgae,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: color,
      fontSize: 18.0);
}
