
import 'package:gellary/models/login_data_model.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{
  late LoginDataModel loginDataModel;
  LoginSuccessState( this.loginDataModel);
}
class LoginErrorState extends LoginStates{
  final String error;
  LoginErrorState(this.error);
}
class LoginChangeVisibilityState extends LoginStates{}
