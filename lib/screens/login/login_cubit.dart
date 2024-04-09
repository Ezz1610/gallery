
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/models/login_data_model.dart';
import 'package:gellary/shared/network/dio_helper.dart';
import 'login_state.dart';


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);

  late LoginDataModel loginDataModel;
  void userLogin({
    required String emailAddress,
    required String password,

  })
  {
    emit(LoginLoadingState()) ;
    DioHelper.loginRequest(
        data: {
          "email":emailAddress,
          "password":password,
        })?.then((value) {
          print("response is : ");
          print(value.data);
      loginDataModel=LoginDataModel.fromJson(value.data);

          emit(LoginSuccessState(loginDataModel));// if code is 200
    }).catchError((error){
      emit(LoginErrorState(error.toString()));//if code is not 200
    });
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility()
  {
    isPassword =!isPassword;
    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(LoginChangeVisibilityState());
  }
}

