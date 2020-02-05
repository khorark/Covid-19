import 'dart:convert';

import 'package:shelf/shelf.dart' as shelf;

const _auth_token = 'Y29yb25hdmlydXNfemF4dmF0aXZhZXRfdmVzX21pcg';

shelf.Response _contentType(shelf.Response response) =>
    response.change(headers: {'content-type': 'application/json'});
shelf.Response _checkAuth(shelf.Request request) {
  if (!request.headers.containsKey('authorization') ||
      request.headers['authorization'] != 'Basic $_auth_token') {
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
