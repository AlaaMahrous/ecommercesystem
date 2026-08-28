import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Find Product",
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, size: 29),
              prefixIconColor: Colors.grey,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const HugeIcon(
            icon: HugeIcons.strokeRoundedNotification01,
            size: 27,
          ),
        ),
      ],
    );
  }
}
