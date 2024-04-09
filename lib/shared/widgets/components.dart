
import 'dart:io';
import 'package:flutter/material.dart';



Widget defaultButton({
   double width=double.infinity,
   Color background=Colors.blue,
   bool isUpperCase=true,
  double raduis=0,
  double height=40,
  required Function() function,
  required String text,
})=>
Container(
  width: width,
  height: height,
  decoration:BoxDecoration(
    borderRadius: BorderRadius.circular(raduis,),
    color: background,

  ),
child: MaterialButton(
  onPressed: function,
child:Text(
    isUpperCase?text.toUpperCase():text,
style:const TextStyle(
color: Colors.white,
),

),
),
);

Widget defultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String) ?onFieldSubmit,
  Function(String) ?onChange,
  required String label,
  required IconData prefix,
  required Function validate,
  bool isPassword =false,
   IconData ?suffix,
  Function ?suffixPressed,
    Function ?onTap,

})=> TextFormField(
controller:controller ,
keyboardType:type,
onFieldSubmitted:onFieldSubmit,
obscureText:isPassword,
  onChanged:onChange ,
decoration: InputDecoration(
labelText: label,
border: OutlineInputBorder(),
prefixIcon:Icon(
  prefix,
),
   /* suffixIcon:Icon(
      suffix,
    ),*/
 suffixIcon:suffix!=null?IconButton(

   onPressed:()
     {
       suffixPressed!();
     },
   icon: Icon(
        suffix
    ),
 ):null,
),
  validator:(s){
    validate(s);
    return null;
  },
   onTap:(){
  Function onTap;
   },

);

void navigetToAndFinish(context,widget)=> Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
  builder:(context) => widget,
),
    (Route<dynamic>route)=>false,
);
Widget buildGridImages(File pickedImage,context)=>Container(
  color: Colors.white,
  child: Column
    (
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        clipBehavior: Clip.antiAlias,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),

        ),
        child: Image.file(
          pickedImage,
          width: 90,
          height: 90,
          fit: BoxFit.cover,

        ),
      ),
    ],
  ),
);



