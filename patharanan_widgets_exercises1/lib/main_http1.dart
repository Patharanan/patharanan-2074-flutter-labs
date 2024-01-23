import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<String> fetchPublicIP() async {
  try {
    final response =
        await http.get(Uri.parse("https://api.ipify.org?format=json"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = convert.jsonDecode(response.body);
      final String ipAddress = data["ip"];
      return ipAddress;
    } else {
      throw Exception("Failed to fetch public IP");
    }
  } catch (e) {
    throw Exception("Failed to connect to the API: $e");
  }
}

void main() {
  fetchPublicIP().then((ip) {
    print("Your public IP address is: $ip");
  }).catchError((error) {
    print("Error: $error");
  });
}
