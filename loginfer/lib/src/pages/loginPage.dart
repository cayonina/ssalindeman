import 'package:flutter/material.dart';
import 'package:loginfer/src/bloc/provider.dart';
import 'package:loginfer/src/providers/userProvider.dart';

class LoginPage extends StatelessWidget {
  final userProvider = new UserProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0),
                ]),
            child: Column(
              children: <Widget>[
                Text(
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 60.0,
                ),
                _crearUsuario(context, bloc),
                SizedBox(
                  height: 60.0,
                ),
                _crearContrasena(context, bloc),
                SizedBox(
                  height: 30.0,
                ),
                _crearBoton(context, bloc)
              ],
            ),
          ),
          Text('¿Olvido la Contraseña?'),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _crearBoton(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ElevatedButton(
          onPressed: snapshot.hasData ? () => _login(bloc, context) : null,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 0.0,
            primary: Colors.brown[800],
          ),
        );
      },
    );
  }

  _login(LoginBloc bloc, BuildContext context) {
    userProvider.login(bloc.usuario, bloc.contrasena);
    Navigator.pushReplacementNamed(context, 'home');
  }

  Widget _crearUsuario(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.account_circle_sharp,
                    color: Colors.brown[800],
                  ),
                  labelText: 'Usuario',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              // para controlar la data
              onChanged: bloc.changeusuario,
            ),
          );
        });
  }

  Widget _crearContrasena(BuildContext context, LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.contrasenaStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.brown[800],
                  ),
                  labelText: 'Contraseña',
                  counterText: snapshot.data,
                  errorText: snapshot.error),
              onChanged: bloc.changecontrasena,
            ),
          );
        });
  }

  Widget _crearFondo(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fondoamarillo = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Color.fromRGBO(254, 227, 29, 1.0),
        Color.fromRGBO(119, 93, 81, 1.0),
      ])),
    );

    final circulos = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Color.fromRGBO(255, 255, 255, 0.1)),
    );

    return Stack(
      children: [
        fondoamarillo,
        Positioned(top: 90.0, left: 30.0, child: circulos),
        Positioned(top: -40.0, right: -30.0, child: circulos),
        Positioned(bottom: -50.0, right: 30.0, child: circulos),
        Positioned(top: 45.0, right: 460.0, child: circulos),
        Container(
          padding: EdgeInsets.only(top: 67.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'SSA ENRIQUE LIDEMANN "B"',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
