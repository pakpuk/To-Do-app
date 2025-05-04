import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_hivepackage_app/View/components/home_appbar.dart';
import 'package:to_do_hivepackage_app/View/components/task_widget.dart';
import 'package:to_do_hivepackage_app/View/extensions/space_ex.dart';
import 'package:to_do_hivepackage_app/View/widgets/drawerslider.dart';
import 'package:to_do_hivepackage_app/View/widgets/floatingbutton_widget.dart';
import 'package:to_do_hivepackage_app/main.dart';
import 'package:to_do_hivepackage_app/models/task_model.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';
import 'package:to_do_hivepackage_app/utils/constants.dart';
import 'package:to_do_hivepackage_app/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  @override
  Widget build(BuildContext context) {
    final base = Basewidget.of(context);
    return ValueListenableBuilder<Box<TaskModel>>(
      valueListenable: base.hivedata.taskListenable(),
      builder: (ctx, box, child) {
        var tasks = box.values.toList();
        tasks.sort((a, b) => a.createdAtDate.compareTo(b.createdAtDate));
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: Fab(),
          body: SliderDrawer(
            key: drawerKey,
            animationDuration: 1000,
            isDraggable: false,
            slider: Drawerslider(),
            child: Column(
              children: [
                HomeAppbar(
                    drawerKey: drawerKey), // Ensure the app bar is visible
                Expanded(
                    child: _buildhome(context, base,
                        tasks)), // Add Expanded to fill remaining space
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox _buildhome(
      BuildContext context, Basewidget base, List<TaskModel> tasks) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(60),
            height: 100,
            child: Row(
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation(AppColors.primaryColor),
                    )),
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppString.mainTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    3.h,
                    Text(
                      "1 of 3 tasks",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              thickness: 2,
              indent: 100,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 745,
            child: tasks.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      var task = tasks[index];
                      return Dismissible(
                          direction: DismissDirection.horizontal,
                          background: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ),
                              8.w,
                              Text(
                                AppString.deleteTask,
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                          onDismissed: (_) {
                            base.hivedata.deleteTask(task: task);
                          },
                          key: Key(task.id),
                          child: Taskwidget(
                            task: task,
                          ));
                    })
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInUp(
                        child: SizedBox(
                          height: 200,
                          width: 200,
                          child: LottieBuilder.asset(
                            Constants.lottieUrl,
                            animate: tasks.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      8.h,
                      Text(AppString.doneAllTask)
                    ],
                  ),
          )
        ],
      ),
    );
  }
}
