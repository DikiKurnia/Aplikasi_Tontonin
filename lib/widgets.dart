import 'package:flutter/material.dart';
import 'data.dart';

Color hueColor(double hue, double lightness) =>
    HSLColor.fromAHSL(1, hue, 0.7, lightness).toColor();

class PosterImage extends StatelessWidget {
  final String path;
  final double hue;

  const PosterImage({super.key, required this.path, required this.hue});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              hueColor(hue, 0.2),
              hueColor((hue + 40) % 360, 0.1),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineNumber extends StatelessWidget {
  final String text;

  const OutlineNumber({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w800,
        foreground: Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.2
          ..color = kCyan,
        shadows: [Shadow(color: kCyan.withOpacity(0.6), blurRadius: 8)],
      ),
    );
  }
}

class PresaleTag extends StatelessWidget {
  const PresaleTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: kBg.withOpacity(0.8),
        border: Border.all(color: kMag),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: kMag.withOpacity(0.5), blurRadius: 8)],
      ),
      child: const Text(
        'PRESALE',
        style: TextStyle(fontSize: 9, color: kMag),
      ),
    );
  }
}
