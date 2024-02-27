import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Blocs/Internet_Block/internet_events.dart';
import 'package:flutterbloc/Blocs/Internet_Block/internet_states.dart';

class InternetBloc extends Bloc<InternetEvent, InternetStates> {
  StreamSubscription? subscription;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    subscription=Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if(result ==ConnectivityResult.mobile|| result==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }else{
        add(InternetLostEvent());

      }
      // Got a new connectivity status!
    });
  }
  @override
  Future<void> close() {
    // TODO: implement close
    subscription?.cancel();
    return super.close();
  }
}