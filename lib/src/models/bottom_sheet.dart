// return bottom sheet

import 'package:flutter/material.dart';

class CustomBottomSheet {
  final Widget content;
  final BuildContext context;

  CustomBottomSheet({
    required this.content,
    required this.context,
  });

  bottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (context) =>
          SizedBox(width: MediaQuery.of(context).size.width, child: content),
    );
  }
}
