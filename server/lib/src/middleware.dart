import 'dart:convert';

import 'package:shelf/shelf.dart' as shelf;
import 'package:corona_virus_server/const/auth_token.dart' as auth;

shelf.Response _contentType(shelf.Response response) =>
    response.change(headers: {'content-type': 'application/json'});
shelf.Response _checkAuth(shelf.Request request) {
  if (!request.headers.containsKey('authorization') ||
      request.headers['authorization'] != 'Basic ${auth.auth_token}') {
    var res = {
      'status': 403,
      'error': 'Credentials error!',
    };

    return shelf.Response.forbidden(jsonEncode(res));
  }
  return null;
}

shelf.Middleware configMiddleware = shelf.createMiddleware(
    requestHandler: _checkAuth, responseHandler: _contentType);
