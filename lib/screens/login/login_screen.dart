

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/screens/home/home_screen.dart';
import 'package:gellary/shared/widgets/components.dart';
import 'login_cubit.dart';
import 'login_state.dart';

class LoginScreen extends StatelessWidget {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
//bool isPassword=true;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit,LoginStates>(

      listener: (context, state) {

        if(state is LoginSuccessState)
        {
          navigetToAndFinish(context,  HomeScreen(loginDataModel: state.loginDataModel,));
          print("navigate to HomeScreen ");
        }
        else if(state is LoginLoadingState){
          print("LoginLoadingState");}
      },
      builder: (context , state){

        return Scaffold(
          appBar: AppBar(),
          body:SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "LOGIN",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    defultTextFormField
                      (
                        controller:emailController ,
                        type: TextInputType.emailAddress,
                        label: "Email Address",
                        prefix: Icons.email_outlined,
                        validate: (String? value){
                          if( value==null)
                          {
                            return "email must not be empty";
                          }

                          return null;
                        }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defultTextFormField
                      (

                      controller:passwordController ,
                      type: TextInputType.visiblePassword,
                      label: " Password",
                      prefix: Icons.lock_outlined,
                      suffix: LoginCubit.get(context).suffix,
                      isPassword:  LoginCubit.get(context).isPassword,//obscure
                      suffixPressed: ()
                      {
                        LoginCubit.get(context).changePasswordVisibility();


                      },
                      validate: (String? value)
                      {
                        if(value==null)
                        {return "email must not be empty";}
                        else if( value.length<5)
                        {return"password must not be less than 5 numbers";}
                        else
                        {return null;}
                      },
                      onFieldSubmit: (value){
                        LoginCubit.get(context ).userLogin(
                          emailAddress: emailController.text,
                          password: passwordController.text,
                        );
                      },

                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition:state is! LoginLoadingState ,
                      builder: (BuildContext context) => defaultButton(
                          text: "login",
                          function: () {
                            if(formKey.currentState!.validate())
                            {
                              LoginCubit.get(context).userLogin(
                                emailAddress: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          }
                      ),
                      fallback: (BuildContext context)=>const Center(child: CircularProgressIndicator()),
                    ),

                  ],
                ),
              ),
            ),

          ),
        );
      },
    );
  }
}
