import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:loginfer/src/bloc/validators.dart';

class LoginBloc with Validators {
  final _usuarioController = BehaviorSubject<String>();
  final _contrasenaController = BehaviorSubject<String>();

  // recuperar datos del stream

  Stream<String> get usuarioStream =>
      _usuarioController.stream.transform(validarUsuario);
  Stream<String> get contrasenaStream =>
      _contrasenaController.stream.transform(validarContrasena);

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(usuarioStream, contrasenaStream, (e, p) => true);
  // insertar valores al string

  Function(String) get changeusuario => _usuarioController.sink.add;
  Function(String) get changecontrasena => _contrasenaController.sink.add;

// obtener el ultimo valor ingresado
  String get usuario => _usuarioController.value;
  String get contrasena => _contrasenaController.value;

  dispose() {
    _usuarioController?.close();
    _contrasenaController?.close();
  }
}
