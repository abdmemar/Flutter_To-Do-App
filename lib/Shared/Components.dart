

import 'package:flutter/material.dart';
import 'package:todo/Shared/cubit/cubit.dart';



Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
   onSubmit,
   onChange,
   onTap,
  bool isPassword = false,
  required  validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
   suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
Widget TaskItem (Map model , context) => Dismissible(
  key : Key(model['id'].toString()) ,
  child: Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 40.0,
  
          child: Text('${model['time']}'),
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            children: [
  
              Text ('${model['title']} ' ,
  
                style: TextStyle(
  
                  fontSize: 16.0 ,
  
                  fontWeight: FontWeight.bold ,
  
                ),),
  
              Text ('${model['date']} ' ,
  
                style: TextStyle(
  
                  fontSize: 16.0 ,
  
                  fontWeight: FontWeight.bold ,
  
                ),),
  
            ],
  
          ),
  
  
  
        ),
  
        SizedBox(
  
          width: 20.0,
  
        ),
  
        IconButton(onPressed:
  
          () {AppCubit.get(context).updateData('done', model['id']);
  
  
  
        } ,
  
            icon: Icon(
  
              Icons.check_box_sharp
  
            )),
  
        IconButton(onPressed:  () {
  
  
  
          AppCubit.get(context).updateData('archive', model['id']);
  
  
  
        }  ,
  
            icon: Icon(
  
                Icons.archive_outlined
  
            )),
  
      ],
  
    ),
  
  ),
  onDismissed: (direction) {
    AppCubit.get(context).deleteData(model['id']) ;

  },
) ;