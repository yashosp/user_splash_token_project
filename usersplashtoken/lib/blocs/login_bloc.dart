import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:usersplashtoken/repo/auth_repo.dart';
import 'package:usersplashtoken/repo/repo_result.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginNotConnected extends LoginState {}

class LoginErrorState extends LoginState {
  final String? error;
  LoginErrorState({this.error});
  @override
  List<Object?> get props => [error];
}

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitLogin extends LoginEvent {
  final String username;
  final String password;

  SubmitLogin(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final IAuthenticationRepository _authRepository;
  LoginBloc(super.initialState, this._authRepository) {
    on<SubmitLogin>(_onSubmitLogin as EventHandler<SubmitLogin, LoginState>);
  }
  Future<void> _onSubmitLogin(
      SubmitLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    // var formatUsername = await Username
    var result = await _authRepository.login(event.username, event.password);
    if (result is Success) {
      emit(LoginSuccessState());
      return;
    }
    // if
  }
}
