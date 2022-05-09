abstract class CounterStates {}
class CounterInitial extends CounterStates {}
class CounterMinusState extends CounterStates {
final int counter ;
CounterMinusState(this.counter);

}
class CounterPlusState extends CounterStates {
  final int counter ;

  CounterPlusState(this.counter);


}