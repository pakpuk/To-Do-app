import 'package:flutter/material.dart';
import 'package:to_do_hivepackage_app/utils/strings.dart';

class ReptextWidget extends StatelessWidget {
  const ReptextWidget({
    super.key,
    required this.titleController,
    this.isDescription = false,
    required this.onFieldSubmitted,
    required this.onChanged,
  });
  final TextEditingController titleController;
  final bool isDescription;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ListTile(
        title: TextFormField(
          controller: titleController,
          maxLines: isDescription ? 6 : null,
          cursorHeight: isDescription ? 60 : null,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: isDescription ? InputBorder.none : null,
            prefixIcon: isDescription
                ? const Icon(
                    Icons.bookmark_outline_rounded,
                    color: Colors.grey,
                  )
                : null,
            hintText: isDescription ? AppString.addNote : null,
            counter: Container(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
