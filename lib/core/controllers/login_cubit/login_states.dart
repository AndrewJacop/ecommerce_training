import 'package:ecommerce_training/models/user_model.dart';

abstract class LoginState {}

class LoginInitState extends LoginState {}

class LoginDone extends LoginState {
  final UserModel userModel;
  LoginDone(this.userModel);
}

class LoginError extends LoginState {}

class LoginLoading extends LoginState {}
