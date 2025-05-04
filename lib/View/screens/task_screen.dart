import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:to_do_hivepackage_app/View/components/Date_time_selctor.dart';
import 'package:to_do_hivepackage_app/View/components/task_appbar.dart';
import 'package:to_do_hivepackage_app/View/extensions/space_ex.dart';
import 'package:to_do_hivepackage_app/View/widgets/Material_button.dart';
import 'package:to_do_hivepackage_app/View/widgets/RepText_widget.dart';
import 'package:to_do_hivepackage_app/main.dart';
import 'package:to_do_hivepackage_app/models/task_model.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';
import 'package:to_do_hivepackage_app/utils/constants.dart';
import 'package:to_do_hivepackage_app/utils/strings.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen(
      {super.key,
      required this.titleController,
      required this.descriptionController,
      this.taskModel});

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TaskModel? taskModel;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var title;
  var subtitle;
  DateTime? time;
  DateTime? datee;

  bool isTaskeAlreadyExist() {
    if (widget.titleController?.text == null &&
        widget.descriptionController?.text == null) {
      return true;
    } else {
      return false;
    }
  }

  String showtime(DateTime? time) {
    if (widget.taskModel?.createdAttime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a')
          .format(widget.taskModel!.createdAttime)
          .toString();
    }
  }

  String showdate(DateTime? date) {
    if (widget.taskModel?.createdAtDate == null) {
      if (date == null) {
        return DateFormat('yyyy-MMMM-dd').format(DateTime.now()).toString();
      } else {
        return DateFormat('yyyy-MMMM-dd').format(date).toString();
      }
    } else {
      return DateFormat('yyyy-MMMM-dd')
          .format(widget.taskModel!.createdAtDate)
          .toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (widget.taskModel?.createdAtDate == null) {
      if (date == null) {
        return DateTime.now();
      } else {
        return date;
      }
    } else {
      return widget.taskModel!.createdAtDate;
    }
  }

  dynamic isTaskAlreadyExistUpadeteOtherwiseCreate() {
    if (widget.descriptionController?.text != null &&
        widget.titleController?.text != null) {
      try {
        widget.titleController.text = title;
        widget.descriptionController.text = subtitle;
        widget.taskModel?.save();
      } catch (e) {
        updateTaskWarning(context);
      }
      ;
    } else {
      if (title != null && subtitle != null) {
        var taskModel = TaskModel.create(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          subtitle: subtitle,
          createdAttime: time,
          createdAtDate: datee,
        );
        Basewidget.of(context).hivedata.addTask(task: taskModel);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: TaskAppBar(),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              _build_top_textmethod(context),
              SizedBox(
                width: double.infinity,
                height: 535,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title of TextFiled
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          AppString.titleOfTitleTextField,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ),
                      ReptextWidget(
                        titleController: widget.titleController,
                        onFieldSubmitted: (String inputtitle) {
                          title = inputtitle;
                        },
                        onChanged: (String inputtitle) {
                          title = inputtitle;
                        },
                      ),
                      10.h,
                      ReptextWidget(
                        titleController: widget.descriptionController,
                        isDescription: true,
                        onFieldSubmitted: (String inputsubtitle) {
                          title = inputsubtitle;
                        },
                        onChanged: (String inputsubtitle) {
                          title = inputsubtitle;
                        },
                      ),
                      Time_selctor_widget(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                    height: 280,
                                    child: TimePickerWidget(
                                      initDateTime: showDateAsDateTime(time),
                                      onChange: (_, __) {},
                                      dateFormat: 'HH:mm',
                                      onConfirm: (datetime, _) {
                                        setState(() {
                                          if (widget.taskModel?.createdAttime ==
                                              null) {
                                            time = datetime;
                                          } else {
                                            widget.taskModel!.createdAttime =
                                                datetime;
                                          }
                                        });
                                      },
                                    ),
                                  ));
                        },
                        title: AppString.timeString,
                        time: showtime(time),
                      ),
                      Time_selctor_widget(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              dateFormat: 'yyyy-MMMM-dd',
                              initialDateTime: showDateAsDateTime(datee),
                              maxDateTime: DateTime(2035, 12, 31),
                              locale: DateTimePickerLocale.en_us,
                              onConfirm: (date, _) {
                            setState(() {
                              if (widget.taskModel?.createdAttime == null) {
                                datee = date;
                              } else {
                                widget.taskModel!.createdAttime = date;
                              }
                            });
                          });
                        },
                        title: AppString.dateString,
                        time: showdate(datee),
                      ),
                      30.h,
                      Row(
                        mainAxisAlignment: isTaskeAlreadyExist()
                            ? MainAxisAlignment.center
                            : MainAxisAlignment.spaceEvenly,
                        children: [
                          isTaskeAlreadyExist()
                              ? Container()
                              : MaterialButtonWidget(
                                  onTap: () {},
                                  title: AppString.deleteTask,
                                  icon: Icons.delete,
                                  color: Colors.white,
                                  textColor: AppColors.primaryColor,
                                ),
                          MaterialButtonWidget(
                            onTap: () {
                              isTaskAlreadyExistUpadeteOtherwiseCreate();
                              Navigator.pop(context);
                            },
                            title: AppString.addNewTask,
                            color: AppColors.primaryColor,
                            textColor: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _build_top_textmethod(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
          RichText(
              text: TextSpan(
                  text: isTaskeAlreadyExist()
                      ? AppString.addNewTask
                      : AppString.updateCurrentTask,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: [
                TextSpan(
                  text: AppString.taskStrnig,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ])),
          SizedBox(
            width: 70,
            child: Divider(
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
