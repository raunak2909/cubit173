import 'package:cubit173/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{

  CounterCubit() : super(CounterState(count: 0));  //initial state

 /// events
   void incrementCount(){
     //var count = state;
     emit(CounterState(count: state.count + 1));
   }

  void decrementCount(){
    //var count = state;
    if(state.count>0) {
      emit(CounterState(count: state.count - 1));
    }
  }


}