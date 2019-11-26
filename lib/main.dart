import 'package:dating_app/pages/bloc_main_page.dart';
import 'package:dating_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

void main() {
  final UserRepository userRepository = UserRepository();
  runApp(BlocMainPage(userRepository: userRepository));
}
