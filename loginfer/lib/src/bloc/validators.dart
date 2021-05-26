import 'dart:async';

class Validators {
  final validarUsuario = StreamTransformer<String, String>.fromHandlers(
      handleData: (usuario, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(usuario)) {
      sink.add(usuario);
    } else {
      sink.addError('Usuario Incorrecto');
    }
  });

  final validarContrasena = StreamTransformer<String, String>.fromHandlers(
      handleData: (contrasena, sink) {
    if (contrasena.length >= 6) {
      sink.add(contrasena);
    } else {
      sink.addError('Mas de 6 caracteres');
    }
  });
}
