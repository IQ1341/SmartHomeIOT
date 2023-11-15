import 'package:http/http.dart' as http;

class BlynkApi {
  static final String authToken = 'NzrWkpdv60IKs-mP98QWx9q3wgODXQH0';
  static final String updateUrl = 'https://blynk.cloud/external/api/update';

  static void toggleLed(bool isOn, int ledVirtualPin) async {
    int value = isOn ? 1 : 0;
    String url = '$updateUrl?token=$authToken&v$ledVirtualPin=$value';
    await http.get(Uri.parse(url));
  }
}
