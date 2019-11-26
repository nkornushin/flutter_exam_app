import 'package:dating_app/models/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class UserState {}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  UserLoaded({@required this.user}) : assert(user != null);
  final User user;
}

class UserError extends UserState {}
