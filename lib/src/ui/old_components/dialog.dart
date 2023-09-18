import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/components/atmos/buttons/text_button.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String? confirmText;
  final void Function()? confirmFunction;
  final Widget content;
  final bool buttons;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.confirmText,
    this.confirmFunction,
    required this.buttons,
  });

  @override
  createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animateController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animateController, curve: Curves.fastEaseInToSlowEaseOut));

    _animateController.forward();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.6),
                thickness: 1,
              ),
              const SizedBox(height: 8),
              widget.content,
              widget.buttons
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 36),
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
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
