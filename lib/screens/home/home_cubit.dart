import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/screens/home/home_state.dart';
import 'package:gellary/shared/document_helper.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);

   List<File>files=[];

   void showPopupMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);
    print("${offset.dx + button.size.width/5}");
    print("${offset.dx + button.size.width}");
    showMenu(
      color: Colors.white70,
      // shadowColor:Colors.blue,
      // surfaceTintColor:Colors.green,
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx+ button.size.width/5,
        offset.dy + button.size.height/2,
        offset.dx + button.size.width/5,
        offset.dy + button.size.height/2,
      ),
      items: [
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text('Gallery'),
            onTap: () async{
              var res= await DocumentHelper.pickImageMethod(PickImageFromEnum.gallery, context);
              if(res!=null){
                files.add(res);
                emit(PickImageFromGallery());


              }
              print("gallery res is :${res}");
              // Navigator.pop(context);
            },
          ),
        ),
        PopupMenuItem(
          child: ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () async{
              var res=await   DocumentHelper.pickImageMethod(PickImageFromEnum.camera, context);
              if(res!=null){
                files.add(res);
                emit(PickImageFromCamera());
              }

              // Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
