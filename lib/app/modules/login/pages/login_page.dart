import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_bloc.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_event.dart';
import 'package:my_smart_app/app/modules/login/bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc bloc;

  LoginPage({required this.bloc});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
        bloc: widget.bloc,
        builder: (context, state) {
          Widget bodyWidget = Center(
            child: CircularProgressIndicator(),
          );

          if (state is Loading) {
            bodyWidget = Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Success) {
            Modular.to.navigate("/home/");
          } else if (state is Failure) {
            bodyWidget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(),
                Text("Ocorreu um Problema tente novamente."),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        widget.bloc.add(Find());
                      },
                      child: Text("Recaregar Página")),
                ),
              ],
            );
          } else if (state is Loaded) {
            bodyWidget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(),
                ElevatedButton(
                    onPressed: () {
                      widget.bloc.add(LoginWithGoogle());
                    },
                    child: Text("Google")),
              ],
            );
          } else {
            bodyWidget = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(),
                Text("Ocorreu um Problema tente novamente."),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        widget.bloc.add(Find());
                      },
                      child: Text("Recaregar Página")),
                ),
              ],
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: bodyWidget,
          );
        });
  }
}
