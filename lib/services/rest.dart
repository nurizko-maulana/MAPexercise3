//-----------------------------------------------------------------------------------------------------------------------------
//? This class is fully given. It is used for handling the actual REST calls
// Note that, the methods in this class are declared as 'static' so that
//  they can be called to directly from the class (that means, no need to create an object first).
//-----------------------------------------------------------------------------------------------------------------------------

import 'dart:convert';
import 'package:http/http.dart' as http;

class Rest {
  //? Change the baseUrl according to your PC's IP address. Remain the port as 3000
  static const String _baseUrl = 'http://192.168.0.102:3000';

  // Send a GET request to retrieve data from a REST server
  static Future get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // Send a POST request to add a new in the REST server
  static Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // Send a PUT request to update an existing data in the REST server.
  static Future put(String endpoint, {dynamic data}) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // Send a PATCH request to update parts of an existing data in the REST server.
  static Future patch(String endpoint, {dynamic data}) async {
    final response = await http.patch(Uri.parse('$_baseUrl/$endpoint'),
        headers: {'Content-Type': 'application/json'}, body: jsonEncode(data));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response;
  }

  // Send a DELETE request to remove an existing data from the REST server.
  static Future<bool> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    }
    throw response;
  }
}
