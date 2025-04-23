import 'package:flutter/material.dart';

class BusyOverlay extends StatelessWidget {
  const BusyOverlay({super.key, required this.child, required this.show});
  final Widget child;
  final bool show;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Material(
      child: IgnorePointer(
        ignoring: show,
        child: Stack(
          children: [
            child,
            if (show)
              Container(
                height: size.height,
                width: size.width,
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
