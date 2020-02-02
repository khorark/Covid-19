import 'package:corona_virus_server/src/database.dart';
import 'package:shelf/shelf.dart' as shelf;

Future<dynamic> routeProcessing(shelf.Request request) async {
  var url = request.url.toString();
  var queryParams = Uri.parse(url).queryParameters;
  var path = Uri.parse(url).path;

  switch (path) {
    case 'news':
      var data = await getDataWithKey('news');
      if (data == null) {
        return '';
      }
      var lang = queryParams['lang'] == 'ru' ? 'ru' : 'en';

      return data[lang];
      break;
    case 'stats':
      var data = await getDataWithKey('stats');
      if (data == null) {
        return '';
      }
      return data;
    default:
    print('11111');
      return '';
  }
}
