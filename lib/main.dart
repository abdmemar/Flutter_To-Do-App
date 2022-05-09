import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'Modules/Counter/counter.dart';

import 'Layout/home.dart';
import 'Shared/bloc_observer.dart';

void main() {
  void main() {
    BlocOverrides.runZoned(
          () {
        // Use cubits...
      },
      blocObserver: MyBlocObserver(),
    );
  }
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

        home:  Home() ,
    );
  }
}

