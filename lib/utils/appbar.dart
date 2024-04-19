import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar({
    required this.title,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 25,),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 110, 228, 255),
                      Color.fromARGB(221, 29, 26, 233)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, -20),
                        color: Color(0xff2B3445),
                        blurRadius: 30,
                        spreadRadius: 0),
                    BoxShadow(
                        offset: Offset(0, 20),
                        color: Color(0xff10141C),
                        blurRadius: 30,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0XFF34C8E8), Color(0xff4E4AF2)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/pngs/back_left.png"),
              ),
            ],
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class GradientBorder extends StatelessWidget {
  final Widget child;
  final double width;
  final Gradient gradient;

  const GradientBorder(
      {required this.child, required this.width, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: GradientBorderPainter(width: width, gradient: gradient),
      child: child,
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final double width;
  final Gradient gradient;

  GradientBorderPainter({required this.width, required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader =
          gradient.createShader(Rect.fromLTWH(0.0, 0.0, size.width, width));
    canvas.drawRRect(RRect.fromRectXY(Rect.zero, 0.0, 0.0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
