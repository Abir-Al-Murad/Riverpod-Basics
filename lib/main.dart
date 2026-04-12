import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_riverpod_app/class%2010(Get%20API)/get_api_screen.dart';
import 'package:my_riverpod_app/class%2011(family%20builder%20provider)/family_screen.dart';
import 'package:my_riverpod_app/class%207(CRUD)/providers/screen.dart';
import 'package:my_riverpod_app/class%208(future%20provider)/future_screen.dart';
import 'package:my_riverpod_app/class%209(stream%20provider)/stream_screen.dart';
import 'package:my_riverpod_app/features/home/presentation/screens/counter_home_screen.dart';
import 'package:my_riverpod_app/features/product/presentation/screens/product_list_screen.dart';
import 'package:my_riverpod_app/practice%20basics/xyz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // Responsible for managing every scope of riverpod or provider..**Stores all provider states.
      child: MaterialApp(
        title: 'Riverpod',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: StreamScreen(),
      ),
    );
  }
}
