import 'dart:async';
import 'dart:convert';

import 'package:corona_virus_server/news.dart';
import 'package:corona_virus_server/src/middleware.dart';
import 'package:corona_virus_server/stats.dart';
import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:corona_virus_server/router.dart' as router;

const _hostname = '127.0.0.1';
const _port = 3000;

void main(List<String> args) async {
  var handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware(configMiddleware)
      .addHandler(_echoRequest);

  var server = await io.serve(handler, _hostname, _port);
  print('Serving at http://${server.address.host}:${server.port}');

  getData();
}

Future<shelf.Response> _echoRequest(shelf.Request request) async {
  var res = {
    'status': 200,
    'data': await router.routeProcessing(request),
  };
  var response = jsonEncode(res);
  return shelf.Response.ok(response,
      headers: {'content-type': 'application/json'});
}

void getData() {
  Timer(Duration(minutes: 10), () => getData());

  getStats();
  getAllNews();
}
