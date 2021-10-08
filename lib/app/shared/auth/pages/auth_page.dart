import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/shared/auth/bloc/auth_bloc.dart';
import 'package:my_smart_app/app/shared/auth/bloc/auth_state.dart';

class AuthPage extends StatefulWidget {
  final AuthBloc bloc;
  const AuthPage({required this.bloc});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        bloc: widget.bloc,
        builder: (context, state) {
          if (state is Logged) {
            Modular.to.navigate("/home/");
          } else if (state is NotLogged) {
            Modular.to.navigate("/login/");
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}
