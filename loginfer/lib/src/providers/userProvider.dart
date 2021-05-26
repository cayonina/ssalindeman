import 'dart:convert';

import 'package:http/http.dart' as http;

class UserProvider {
  final String _firebaseToken = 'AIzaSyAkqV1UYRoGY1w7bQRzcrp9tT2OqWBoLlY';

  Future<Map<String, dynamic>> login(String user, String clave) async {
    final authData = {
      'user': user,
      'clave': clave,
      'returnSecureToken': true,
    };

    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToken'),
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      // TODO_ SALVAR EN STORAGE
      return {'ok': true, 'token': decodedResp['idToken']};
    } else {
      return {'ok': false, 'mensaje': decodedResp['error']['message']};
    }
  }

  Future<Map<String, dynamic>> nuevoUsuario(String user, String clave) async {
    final authData = {
      'user': user,
      'clave': clave,
      'returnSecureToken': true,
    };

    final resp = await http.post(
        Uri.parse(
            'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToken'),
        body: json.encode(authData));

    Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
  }
}
