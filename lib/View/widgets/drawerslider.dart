import 'package:flutter/material.dart';
import 'package:to_do_hivepackage_app/View/extensions/space_ex.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';

class Drawerslider extends StatelessWidget {
  const Drawerslider({super.key});

  @override
  Widget build(BuildContext context) {
    List<IconData> Menu_icons = [
      Icons.home,
      Icons.person,
     Icons.settings,
     Icons.details
    ];
    List<String> MenuIcNames = [
      "Home",
      "Profile",
      "Settings",
      "Deatails",
    ];
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: AppColors.primaryGradientColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("url"),
              radius: 50,
            ),
            8.h,
            Text(
              "Sefiane Ghaith",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
            6.h,
            Text(
              "Flutter Dev",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Colors.grey),
            ),
            8.h,
            ListView.builder(
              itemCount: Menu_icons.length,
              itemBuilder: (BuildContext context,index){
              return Container(
                child: ListTile(
                  leading: Icon(Menu_icons[index],
                  color: Colors.white,
                  size: 30,),
                ),
              )
            })
  
          ],
        ),
      ),
    );
  }
}
