import 'package:add/functions/alert_popup.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactArtist {
  static void mailTo(email) async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: email,
        query:
            'subject= Write Subject  here, please&body=Hello, please write details here');
    final url = params.toString();
    launchUrlString(url);
  }

  static void openWhatsapp(phoneNumber) async {
    try {
      var url = 'https://wa.me/$phoneNumber';
      launchUrlString(url);
    } catch (e) {
      print(e);
    }
  }
}
