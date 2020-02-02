import 'dart:io';
import 'dart:convert';

final filename = './db.json';

void saveData(String key, dynamic data) async {
  var json = await getAllData();
  json[key] = data;
  await File(filename).writeAsString(jsonEncode(json));
  print('Data with key: $key success save');
}

Future<Map<String, dynamic>> getDataWithKey(String key) async {
  var contents = await File(filename).readAsString();
  var data = jsonDecode(contents);
  return data[key];
}

Future<Map<String, dynamic>> getAllData() async {
  if (await File(filename).exists()) {
    var contents = await File(filename).readAsString();
    return jsonDecode(contents);
  }

  return {};
}
