import 'package:dating_app/bloc/bloc.dart';
import 'package:dating_app/pages/user_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class BlocMainPage extends StatelessWidget {
  const BlocMainPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destiny',
      home: BlocProvider(
        builder: (context) => UserBloc(userRepository: userRepository),
        child: UserPreview(),
      ),
    );
  }
}