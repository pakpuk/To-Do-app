import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget({
    super.key,
    required this.color,
    required this.textColor,
    this.icon,
    required this.title,
  });
  final String title;
  final Color color;
  final Color textColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: textColor),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w300,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
