import 'dart:convert';

import 'package:http/http.dart' as http;

class GdgApi {
  // api call to check backend status
  static Future<Map<String, dynamic>> checkBackendStatus() async {
    final url = Uri.parse('https://gdgapp.swoyam.engineer/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //parse response into map
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': false};
    }
  }

  // api call to get all sites
  static Future<Map<String, dynamic>> getAllSites() async {
    final url = Uri.parse('https://gdgapp.swoyam.engineer/sites/list/');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //parse response into map
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': false};
    }
  }

  // api call to get all sites
  static Future<Map<String, dynamic>> getAllNotifications() async {
    final url = Uri.parse('https://gdgapp.swoyam.engineer/notification/list');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      //parse response into map
      Map<String, dynamic> result = jsonDecode(response.body);
      return result;
    } else {
      return {'status': false};
    }
  }
}
