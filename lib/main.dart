import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_profile/bloc/profile_bloc.dart';
import 'package:github_profile/data/DataRepository.dart';
import 'package:github_profile/pages/GitProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ProfileBloc(DataRepository()),
        child: GitProfile(),
      ),
    );
  }
}
