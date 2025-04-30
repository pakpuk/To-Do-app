import 'package:flutter/material.dart';

class Time_selctor_widget extends StatelessWidget {
  const Time_selctor_widget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 80,
              height: 35,
              child: Center(
                child: Text(
                  title,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
