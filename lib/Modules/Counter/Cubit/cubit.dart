import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Modules/Counter/Cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super (CounterInitial()) ;

  static CounterCubit get(context) => BlocProvider.of(context) ;
  int counter = 1 ;

  void minus (){
    counter--;
    emit(CounterMinusState(counter)) ;
  }
  void plus (){
    counter++;
    emit(CounterPlusState(counter)) ;
  }
}
