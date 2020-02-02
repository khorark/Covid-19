import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<dynamic> fetchGet(String url) async {
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    // print('jsonResponse: $jsonResponse');
    return jsonResponse;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return null;
  }
}
