import 'package:flutter/material.dart';
import 'package:to_do_hivepackage_app/utils/colors.dart';

class Taskwidget extends StatelessWidget {
  const Taskwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, 4),
                  blurRadius: 10)
            ]),
        duration: Duration(milliseconds: 600),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {},
            child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
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
              "Done",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w300),
                      ),
                      Text("SubDate",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
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
