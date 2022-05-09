import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/Modules/ArchivedTasks.dart';
import 'package:todo/Modules/DoneTasks.dart';
import 'package:todo/Modules/NewTasks.dart';
import 'package:todo/Shared/cubit/cubit.dart';
import 'package:todo/Shared/cubit/states.dart';


import '../Shared/Components.dart';
import '../Shared/constants.dart';

class Home extends StatelessWidget {



  //هون ما بعرف ليش حطين  late  عطاني خطأ بدونها
  late Database database ;
  var scaffoldKey = GlobalKey<ScaffoldState>() ;
  var formKey = GlobalKey<FormState>() ;

  var titleController = TextEditingController() ;
  var timeController = TextEditingController() ;
  var dateController = TextEditingController() ;



  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)  => AppCubit()..creatDatabase(),
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (BuildContext context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);


          }
        },
        builder: (BuildContext context,  state) {
          AppCubit cubit = AppCubit.get(context) ;

        return  Scaffold(
            key: scaffoldKey ,
            appBar: AppBar(
              title: Text(
             cubit.appBar[ cubit.currentIndex]  ,
              ),
            ),
            floatingActionButton: FloatingActionButton (
              onPressed: (){
                if (cubit.isBottomSheetSown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text) ;


                  }
                } else {
                  scaffoldKey.currentState?.showBottomSheet((context) => Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0,),
                    child: Form(
                      key : formKey ,
                      child: Column(
                        mainAxisSize: MainAxisSize.min ,
                        children: [
                          defaultFormField(
                            controller: titleController,
                            type: TextInputType.text,
                            validate: ( value){
                              if (value.isEmpty) {
                                return "title must not be empty " ;
                              }
                              return null ;
                            },
                            label: 'Task Title',
                            prefix: Icons.title ,
                          ) ,
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: timeController,
                            type: TextInputType.datetime,
                            onTap: () { showTimePicker(context: context,
                              initialTime: TimeOfDay.now(), ).then((value) {
                              print (value?.format(context));
                              timeController.text = value!.format(context) ;
                            }); },

                            validate: ( value){
                              if (value.isEmpty) {
                                return "time must not be empty " ;
                              }
                              return null ;
                            },
                            label: 'Task Time',
                            prefix: Icons.watch_later ,
                          ) ,
                          SizedBox(
                            height: 15,
                          ),
                          defaultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            onTap: () {
                              showDatePicker(context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse("2022-04-04")).then((value) {

                                dateController.text = DateFormat.yMMMd().format(value!) ;
                              });
                            },

                            validate: ( value){
                              if (value.isEmpty) {
                                return "date must not be empty " ;
                              }
                              return null ;
                            },
                            label: 'Task Date',
                            prefix: Icons.calendar_today ,
                          ) ,
                        ],
                      ),
                    ),
                  ),
                    elevation: 20.0,).closed.then((value) {
                      cubit.changeBottom(isShown: false, icon: Icons.edit) ;

                  });
                  cubit.changeBottom(isShown: true, icon: Icons.add ) ;


                }

              },
              child: Icon(
                cubit.floatingIcon,

              ),

            ),
            // هون هو عامل شكل الشرط غير ف في شي ما زبط معي بالدرس رقم 88 اااخر شي
           //  اذا بعدل شكل الشرط لازم يزبط
            body: cubit.newTasks.length==0 ?
            Center(child: CircularProgressIndicator()) :
            cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex ,
               onTap: (index) {
                cubit.change(index)  ;
            } ,
              items: [
                BottomNavigationBarItem(icon: Icon(
                    Icons.menu),
                    label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(
                    Icons.check_circle_outline),
                    label: 'Done'),
                BottomNavigationBarItem(icon: Icon(
                    Icons.archive_outlined),
                    label: 'Archived'),
              ],
            ),






          );
        },

      ),
    );
  }



}


