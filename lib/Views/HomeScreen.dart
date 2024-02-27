import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Blocs/Internet_Block/internet_main.dart';
import 'package:flutterbloc/Blocs/Internet_Block/internet_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc,InternetStates>(
        builder: (BuildContext context, state) {
          if(state is InternetGainedState){
            return Center(
              child: Text(
                  "Connected"
              ),
            );
          }else if(state is InternetLostState){
            return Center(
              child: Text(
                  "Lossed Connection"
              ),
            );
          } else{
            return Center(
              child: Text(
                  "loading....."
              ),
            );
          }

        },
      ),
    );
  }
}
