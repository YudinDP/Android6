import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/photos_screen.dart';
import 'cubit/mars_rover_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MarsRoverCubit()..loadPhotos(100),
        child: const MarsRoverPhotosScreen(),
      ),
    );
  }
}