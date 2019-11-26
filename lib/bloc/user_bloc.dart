import 'package:dating_app/models/user.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/user_repository.dart';
import './bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({@required this.userRepository}) : assert(userRepository != null);

  final UserRepository userRepository;

  @override
  UserState get initialState => UserEmpty();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is FetchUser) {
      yield UserLoading();
      try {
        final User user = await userRepository.getUser();
        yield UserLoaded(user: user);
      } catch (_) {
        yield UserError();
      }
    }
  }
}
