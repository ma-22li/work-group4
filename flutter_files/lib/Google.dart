import 'package:url_launcher/url_launcher.dart';

class GoogleScreen {
  final Uri _url =
      Uri.parse('http://127.0.0.1:8000/accounts/google/login/?process=login/');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> getLunch() {
    return _launchUrl();
  }

  Future<void> closeLunch() {
    return closeInAppWebView();
  }
}
