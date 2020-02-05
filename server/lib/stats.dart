import 'package:corona_virus_server/src/database.dart';
import 'package:corona_virus_server/src/fetch.dart';

const url = 'https://coronavirus-monitor.ru/api/v1/statistics/get-cities';

void getStats() async {
  var res = await fetchGet(url);
  saveData('stats', res['data']);
}
