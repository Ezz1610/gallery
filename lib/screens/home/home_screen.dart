

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/screens/home/home_cubit.dart';
import 'package:gellary/screens/home/home_state.dart';
import 'package:gellary/shared/document_helper.dart';
import 'package:gellary/models/login_data_model.dart';
import 'package:gellary/screens/login/login_screen.dart';
import 'package:gellary/shared/show_popu_menu.dart';
import 'package:gellary/shared/widgets/components.dart';

class HomeScreen extends StatefulWidget {
final LoginDataModel loginDataModel;
  const  HomeScreen({super.key,required this.loginDataModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState(){
  super.initState();
}

//bool isPassword=true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          "Welcome ${widget.loginDataModel.user!.name}"
        ),
      ),
      body:BlocConsumer<HomeCubit,HomeStates>(
          builder: (context,state){
            var cubit=HomeCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
              padding:   const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          navigetToAndFinish(context, LoginScreen());
                        },
                        child: const Text('Logout'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cubit.showPopupMenu(context);
                        },
                        child: const Text('Upload'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  GridView.count(
                    shrinkWrap: true,
                    physics:  const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    childAspectRatio: 1/1,
                    children: List.generate(
                      cubit.files.length,//length of list
                          (index) =>buildGridImages(cubit.files[index],context),
                    ),

                  ),
                ],
              )
          ),

        );
      }, listener: (context,state){}),
    );
  }


}
