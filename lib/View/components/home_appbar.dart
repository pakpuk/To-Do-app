import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:to_do_hivepackage_app/main.dart';
import 'package:to_do_hivepackage_app/utils/constants.dart';

class HomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerState> drawerKey;
  @override
  State<HomeAppbar> createState() => _HomeAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _HomeAppbarState extends State<HomeAppbar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void OnDrawingToggle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animationController.forward();
        widget.drawerKey.currentState!.openSlider();
      } else {
        animationController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  Widget build(BuildContext context) {
    var base = Basewidget.of(context).hivedata.box;
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: IconButton(
                onPressed: OnDrawingToggle,
                icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    size: 40,
                    progress: animationController)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
                onPressed: () {
                  base.isEmpty
                      ? noTaskWarning(context)
                      : deleteAlltheTask(context);
                },
                icon: Icon(CupertinoIcons.trash, size: 40)),
          )
        ],
      ),
    );
  }
}
