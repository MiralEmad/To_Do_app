import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get screenWidth {
    return MediaQuery.of(this).size.width;
  }

  double get screenHeight {
    return MediaQuery.of(this).size.height;
  }

  bool get isTablet {
    return screenWidth >= 600;
  }

  double get hPadding {
    if (isTablet) {
      return 60;
    }

    return 20;
  }

  double sp(double size) {
    if (isTablet) {
      return size * 1.15;
    }

    return size;
  }
}

class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter({
    super.key,
    required this.child,
    this.maxWidth = 600,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
        ),
        child: child,
      ),
    );
  }
}