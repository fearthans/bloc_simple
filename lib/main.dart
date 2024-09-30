import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/counter_cubit.dart'; // Impor cubit yang sudah dibuat

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        // Membuat instance CounterCubit dan menyediakan ke seluruh widget di bawahnya.
        create: (context) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit Counter Example'),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          // BlocBuilder mendengarkan perubahan state di CounterCubit.
          builder: (context, count) {
            return Text(
              '$count',
              style: TextStyle(fontSize: 40),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            // Saat tombol "+" ditekan, panggil fungsi increment di CounterCubit.
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            // Saat tombol "-" ditekan, panggil fungsi decrement di CounterCubit.
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
