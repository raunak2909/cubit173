import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(onPressed: (){
            BlocProvider.of<CounterCubit>(context).decrementCount();
          }, child: Icon(Icons.remove),),

          FloatingActionButton(
            onPressed: (){
              context.read<CounterCubit>().incrementCount();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
