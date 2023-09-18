import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/theme/theme.dart';

import '../../componentes.dart';

class DraggableCustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final bool buttons;
  final void Function()? confirmFunction;
  final String? confirmText;
  final double? initialSize, minSize, maxSize;
  const DraggableCustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.buttons,
    this.confirmFunction,
    this.confirmText,
    this.initialSize,
    this.minSize,
    this.maxSize,
  });

  @override
  State<DraggableCustomBottomSheet> createState() =>
      _DraggableCustomBottomSheetState();
}

class _DraggableCustomBottomSheetState extends State<DraggableCustomBottomSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialSize ?? 0.4,
      minChildSize: widget.minSize ?? 0.4,
      maxChildSize: widget.maxSize ?? 0.8,
      builder: (context, scrollController) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 18),
                        height: 5,
                        width: 80,
                        decoration: BoxDecoration(
                          color: lightTheme()
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(widget.title,
                      style: Theme.of(context).textTheme.bodyLarge),
                  Divider(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.6),
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: SingleChildScrollView(
                        // scrool when keyboard is open
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior
                                .onDrag, // scrool when keyboard is open
                        controller: scrollController,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: widget.content)),
                  ),
                  widget.buttons
                      ? Padding(
                          padding: const EdgeInsets.only(top: 34, bottom: 12),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton(
                                    context: context,
                                  ).inactive(
                                      label: "Cancelar",
                                      onPressed: Navigator.of(context).pop),
                                  const SizedBox(width: 20),
                                  CustomButton(context: context).active(
                                      label: widget.confirmText ?? "",
                                      onPressed: widget.confirmFunction),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
