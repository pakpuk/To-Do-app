import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_hivepackage_app/View/screens/task_screen.dart';
import 'package:to_do_hivepackage_app/models/task_model.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';

class Taskwidget extends StatefulWidget {
  const Taskwidget({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<Taskwidget> createState() => _TaskwidgetState();
}

class _TaskwidgetState extends State<Taskwidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();
  void initState() {
    super.initState();
    _titleController.text = widget.task.title;
    _subtitleController.text = widget.task.subtitle;
  }

  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(
          builder: (ctx) => TaskScreen(
            titleController: _titleController,
            descriptionController: _subtitleController,
            taskModel: widget.task,
          ),
        );e)
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: widget.task.isCompleted
                ? AppColors.primaryColor.withOpacity(0.1)
                : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ]),
        duration: Duration(milliseconds: 600),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              widget.task.isCompleted = !widget.task.isCompleted;
              widget.task.save();
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.task.isCompleted
                      ? AppColors.primaryColor.withOpacity(0.1)
                      : Colors.white,
                  border: Border.all(color: Colors.grey, width: 8)),
              child: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 3.0, bottom: 5),
            child: Text(
              _titleController.text,
              style: TextStyle(
                color: widget.task.isCompleted
                    ? AppColors.primaryColor
                    : Colors.black,
                fontWeight: FontWeight.w500,
                decoration: widget.task.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _subtitleController.text,
                style: TextStyle(
                  color: widget.task.isCompleted
                      ? AppColors.primaryColor
                      : Colors.black,
                  fontWeight: FontWeight.w300,
                  decoration: widget.task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat("hh:mm a").format(
                          widget.task.createdAttime,
                        ),
                        style: TextStyle(
                            color: widget.task.isCompleted
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                      Text(
                          DateFormat.yMMMEd().format(widget.task.createdAtDate),
                          style: TextStyle(
                              fontSize: 12,
                              color: widget.task.isCompleted
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.w300)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
