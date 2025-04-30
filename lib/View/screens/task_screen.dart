import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:to_do_hivepackage_app/View/components/Date_time_selctor.dart';
import 'package:to_do_hivepackage_app/View/components/task_appbar.dart';
import 'package:to_do_hivepackage_app/View/extensions/space_ex.dart';
import 'package:to_do_hivepackage_app/View/widgets/Material_button.dart';
import 'package:to_do_hivepackage_app/View/widgets/RepText_widget.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';
import 'package:to_do_hivepackage_app/utils/strings.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
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
                      ReptextWidget(titleController: _titleController),
                      10.h,
                      ReptextWidget(
                          titleController: _descriptionController,
                          isDescription: true),
                      Time_selctor_widget(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => SizedBox(
                                    height: 280,
                                    child: TimePickerWidget(
                                      onChange: (_, __) {},
                                      dateFormat: 'HH:mm',
                                      onConfirm: (datetime, _) {},
                                    ),
                                  ));
                        },
                        title: AppString.timeString,
                      ),
                      Time_selctor_widget(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              dateFormat: 'yyyy-MMMM-dd',
                              initialDateTime: DateTime.now(),
                              maxDateTime: DateTime(2035, 12, 31),
                              locale: DateTimePickerLocale.en_us,
                              onConfirm: (date, _) {});
                        },
                        title: AppString.dateString,
                      ),
                      30.h,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButtonWidget(
                            title: AppString.deleteTask,
                            icon: Icons.delete,
                            color: Colors.white,
                            textColor: AppColors.primaryColor,
                          ),
                          MaterialButtonWidget(
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
                  text: AppString.addNewTask,
                  style: Theme.of(context).textTheme.titleLarge,
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
