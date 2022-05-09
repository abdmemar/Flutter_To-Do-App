// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/Shared/Components.dart';
import 'package:todo/Shared/cubit/cubit.dart';
import 'package:todo/Shared/cubit/states.dart';

import '../Shared/constants.dart';

class DoneTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasks = AppCubit.get(context).doneTasks ;
    return
      BlocConsumer<AppCubit , AppStates>(
        listener: (context , state) {},
        builder: (context , state) {
          return ListView.separated(
            itemBuilder: (context, index) => TaskItem(tasks[index] , context) ,
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20 ,
              ),

              child: Container(
                width: double.infinity,
                height: 1.0 ,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length ,
          );
        },

      );
  }
}
