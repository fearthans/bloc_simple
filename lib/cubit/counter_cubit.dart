import 'package:flutter_bloc/flutter_bloc.dart';

// CounterCubit mengelola state berupa angka.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // State awal adalah 0.

  // Fungsi untuk menambah angka.
  void increment() => emit(state + 1);

  // Fungsi untuk mengurangi angka.
  void decrement() => emit(state - 1);
}
