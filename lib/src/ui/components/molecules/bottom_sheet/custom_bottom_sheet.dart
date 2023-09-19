import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/components/componentes.dart';

class CustomBottomSheet extends StatefulWidget {
  final String title;
  final Widget content;
  final bool buttons;
  final void Function()? confirmFunction;
  final String? confirmText;
  final AnimationController? animationController;
  const CustomBottomSheet({
    super.key,
    required this.title,
    required this.content,
    required this.buttons,
    this.confirmFunction,
    this.confirmText,
    this.animationController,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      enableDrag: false,
      animationController: widget.animationController,
      builder: (BuildContext context) {
        return Container(
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const SizedBox(height: 20),
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 20),
                    widget.content,
                    const SizedBox(height: 20),
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
                                      onPressed: Navigator.of(context).pop,
                                    ),
                                    const SizedBox(width: 20),
                                    CustomButton(context: context).active(
                                      label: widget.confirmText ?? "",
                                      onPressed: widget.confirmFunction,
                                    ),
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
        );
      },
    );
  }
}
