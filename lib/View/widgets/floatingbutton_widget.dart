import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_hivepackage_app/View/screens/task_screen.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (_) => TaskScreen(
                    titleController: null,
                    descriptionController: null,
                    taskModel: null,
                  ))),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        elevation: 10,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primaryColor,
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
