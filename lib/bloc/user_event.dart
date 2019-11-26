import 'package:meta/meta.dart';

@immutable
abstract class UserEvent {}

class FetchUser extends UserEvent {}
