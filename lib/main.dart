import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/services/services.dart';
import 'package:spacex/ui/homepage.dart';

import 'bloc/spacex_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => SpacexService(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX',
        home: HomePage(),
      ),
    );
  }
}
