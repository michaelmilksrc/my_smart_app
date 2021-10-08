import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_bloc.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_event.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_state.dart';

class HomePage extends StatefulWidget {
  final HomeBloc bloc;

  const HomePage({required this.bloc});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: widget.bloc,
        builder: (context, state) {
          Widget bodyWidget = Center(
            child: CircularProgressIndicator(),
          );
          if (state is Loading) {
            bodyWidget = Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Loaded) {
            bodyWidget = Center(
              child: ElevatedButton(
                onPressed: () => Modular.to.navigate('./second'),
                child: Text('Navigate to Second Page'),
              ),
            );
          } else if (state is IsLogout) {
            Modular.to.navigate("/");
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
              title: Text('Home Page'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    widget.bloc.add(Logout());
                  },
                  icon: Icon(Icons.exit_to_app, color: Colors.red),
                ),
              ],
            ),
            body: bodyWidget,
          );
        });
  }
}
