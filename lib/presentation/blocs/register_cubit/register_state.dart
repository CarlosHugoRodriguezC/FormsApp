part of 'register_cubit.dart';

enum RegisterStatus {
  invalid,
  valid,
  validating,
}

class RegisterFormState extends Equatable {
  final String username;
  final String email;
  final String password;

  final RegisterStatus status;

  const RegisterFormState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.status = RegisterStatus.invalid,
  });

  RegisterFormState copyWith({
    String? username,
    String? email,
    String? password,
    RegisterStatus? status,
  }) {
    return RegisterFormState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        username,
        email,
        password,
        status,
      ];
}
