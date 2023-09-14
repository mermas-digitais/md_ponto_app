//create a search bar widget with a text field and a search icon
import 'package:flutter/material.dart';

import '../../componentes.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
    this.onSubmitted,
    this.hintText,
    required this.textEditingController,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final TextEditingController textEditingController;
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  initState() {
    super.initState();
    widget.textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            child: SearchBarInput(
              label: widget.hintText ?? '',
              onChanged: widget.onChanged,
              keyboardType: TextInputType.text,
              autoFocus: false,
              controller: widget.textEditingController,
            ),
          ),
        ],
      ),
    );
  }
}
