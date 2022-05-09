import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Modules/Counter/Cubit/cubit.dart';
import 'package:todo/Modules/Counter/Cubit/states.dart';

// state less contain one class provide widget

// state ful contain  classes

// 1. first class provide widget
// 2. second class provide state from this widget

// ignore: use_key_in_widget_constructors
class CounterScreen extends StatelessWidget
{

  // 1. constructor
  // 2. init state
  // 3. build



  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer <CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPlusState)  print('+ ${state.counter}') ;
          if (state is CounterMinusState) print ('- ${state.counter}');


        },
        builder: (context , state ) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Counter',
              ),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: ()
                    {
                     CounterCubit.get(context).minus() ;
                    },
                    child: Text(
                      'MINUS',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ()
                    {
                      CounterCubit.get(context).plus() ;

                    },
                    child: Text(
                      'PLUS',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

