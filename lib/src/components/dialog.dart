import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final Widget content;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
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
      duration: const Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animateController, curve: Curves.easeInOut));

    _animateController.forward();
  }

  @override
  void dispose() {
    _animateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

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
          content: SizedBox(
            width: deviceWidth,
            child: Column(
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
                widget.content,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
