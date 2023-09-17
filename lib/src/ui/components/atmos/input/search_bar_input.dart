import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarInput extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final double? height;
  final double? width;
  final TextInputType keyboardType;
  final bool? autoFocus;
  final TextEditingController? controller;
  final bool? filled;
  final IconData? icon;
  final Function? onClear;
  final void Function()? onSearch;
  final void Function(String)? onSubmitted;

  SearchBarInput({
    super.key,
    required this.label,
    required this.onChanged,
    required this.keyboardType,
    this.height,
    this.width,
    this.validator,
    this.autoFocus,
    this.controller,
    this.filled,
    this.icon,
    this.onClear,
    this.onSearch,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return filled ?? true
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              // color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    keyboardType: keyboardType,
                    autofocus: autoFocus ?? false,
                    controller: controller,
                    onFieldSubmitted: (value) {
                      onSubmitted!(value);
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 14),
                    onChanged: onChanged,
                    validator: validator,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    decoration: InputDecoration(
                      hintText: label,
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      floatingLabelStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                      isDense: false,
                      border: InputBorder.none,
                    ),
                  ),
                ),

                //if user is typing, the icon is null
                Row(
                  children: [
                    controller?.text.isNotEmpty ?? true
                        ? Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  controller?.clear();
                                  onClear!();
                                },
                                style: Theme.of(context)
                                    .iconButtonTheme
                                    .style
                                    ?.copyWith(
                                        backgroundColor:
                                            const MaterialStatePropertyAll(
                                      Colors.transparent,
                                    )),
                                icon: Icon(
                                  Iconsax.close_square,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text("|",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          fontSize: 20,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary)),
                            ],
                          )
                        : const SizedBox.shrink(),
                    IconButton(
                      onPressed: onSearch,
                      style: Theme.of(context).iconButtonTheme.style?.copyWith(
                              backgroundColor: const MaterialStatePropertyAll(
                            Colors.transparent,
                          )),
                      icon: Icon(Iconsax.search_status,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ],
                )
              ],
            ),
          )
        : TextFormField(
            keyboardType: keyboardType,
            autofocus: autoFocus ?? false,
            controller: controller,
            onFieldSubmitted: onSubmitted,
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.start,
            maxLines: 1,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              hintText: label,
              labelStyle: Theme.of(context).textTheme.displaySmall,
              isDense: false,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          );
  }
}
