import 'package:cubit173/counter_cubit.dart';
import 'package:cubit173/counter_state.dart';
import 'package:cubit173/list_cubit.dart';
import 'package:cubit173/list_state.dart';
import 'package:cubit173/next_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => ListCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cubit"),
      ),
      body: BlocBuilder<ListCubit, ListState>(
        builder: (_, state) {
          var dataFromCubit = state.mData;
          return ListView.builder(
              itemCount: dataFromCubit.length,
              itemBuilder: (_, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NextPage(
                            isUpdate: true,
                            mIndex: index,
                            mTitle: '${dataFromCubit[index]['title']}',
                            mDesc: '${dataFromCubit[index]['desc']}'
                          ),
                        ));
                  },
                  title: Text('${dataFromCubit[index]['title']}'),
                  subtitle: Text('${dataFromCubit[index]['desc']}'),
                  trailing: IconButton(
                    onPressed: (){
                      BlocProvider.of<ListCubit>(context).deleteNote(index);
                    },
                    icon: Icon(Icons.delete, color: Colors.red,),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //BlocProvider.of<CounterCubit>(context).incrementCount();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NextPage(),
              ));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
