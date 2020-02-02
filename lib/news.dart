import 'package:corona_virus_server/src/database.dart';
import 'package:corona_virus_server/src/fetch.dart';

var url = 'https://coronavirus-monitor.ru/api/v1/statistics/get-cities';

const API_KEY = '754c321741324f788e9d7ae4beb16ebd';
const langs = {'ru': 'коронавирус', 'en': 'coronavirus'};

String insertParamsToUrl(String q) =>
    'https://newsapi.org/v2/everything?q=${q}&sortBy=publishedAt&pageSize=100&apiKey=${API_KEY}';

Future<Map<String, dynamic>> getNews(String lang) async {
  var url = insertParamsToUrl(langs[lang]);
  var res = await fetchGet(url);
  var data = {lang: res['articles']};
  return data;
}

void getAllNews() async {
  var futures = <Future>[];
  langs.forEach((k, v) => futures.add(getNews(k)));

  var results = await Future.wait(futures);
  var langNews = {};
  results.forEach(
      (objNews) => objNews.forEach((k, v) => (langNews[k] = objNews[k])));

  saveData('news', langNews);
}
