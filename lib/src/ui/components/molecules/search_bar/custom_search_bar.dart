//create a search bar widget with a text field and a search icon
import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/utils/validators/validators.dart';

import '../../componentes.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.onChanged,
    this.onSubmitted,
    this.hintText,
    required this.textEditingController,
    this.onClear,
    this.onSearch,
  });

  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final TextEditingController textEditingController;
  final Function? onClear;
  final void Function()? onSearch;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  initState() {
    super.initState();
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
              onClear: widget.onClear,
              onSearch: widget.onSearch,
              onSubmitted: widget.onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
