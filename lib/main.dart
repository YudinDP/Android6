import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'apod_screen.dart';
import 'cubit/nasa_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ApodCubit()..loadImages(),
        child: const ApodScreen(),
      ),
    );
  }
}