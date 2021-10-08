import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_event.dart';
import 'package:my_smart_app/app/modules/home/bloc/home_state.dart';
import 'package:my_smart_app/app/shared/auth/repositories/auth_repository_interface.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IAuthRepository authRepository;

  HomeBloc({required this.authRepository}) : super(Loading()) {
    add(Find());
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Find) {
      yield* _mapFindToState(event);
    } else if (event is Logout) {
      yield* _mapLogoutToState(event);
    }
  }

  Stream<HomeState> _mapFindToState(HomeEvent event) async* {
    yield Loaded();
  }

  Stream<HomeState> _mapLogoutToState(HomeEvent event) async* {
    await authRepository.logOut();
    yield IsLogout();
  }
}
