import 'package:ecommerce_training/models/user_model.dart';

abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class LoadingRegister extends RegisterState {}

class RegisterDone extends RegisterState {
  final UserModel userModel;
  RegisterDone(this.userModel);
}

class RegisterError extends RegisterState {}

class ChooseImage extends RegisterState {}
