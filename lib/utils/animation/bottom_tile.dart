import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../custom_paint/pinted_bottom_bar.dart';

class BottomTileTranslation extends StatefulWidget {
  double begin;
  double end;
  IconData icon;
  BottomTileTranslation(
      {Key? key, required this.begin, required this.end, required this.icon})
      : super(key: key);

  @override
  _BottomTileTranslationState createState() => _BottomTileTranslationState();
}

class _BottomTileTranslationState extends State<BottomTileTranslation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Adjust duration as needed
    );

    _animation = Tween<double>(begin: widget.begin, end: widget.end).animate(
        CurvedAnimation(parent: _controller!, curve: Curves.easeInOut));

    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation!.value),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: CurvedParallelogramPainter(),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: AppColors.black,blurRadius:0,offset: Offset(0,20) )
                    ],
                    gradient: const LinearGradient(
                      // stops: [0.3,0.8],
                      colors: [
                        Color.fromARGB(255, 56, 53, 246),
                        Color.fromARGB(255, 51, 247, 250),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  width: 173,
                  height: 103,
                  alignment: Alignment.center,
                ),
              ),
              ClipPath(
                clipper: CurvedParallelogramPainter(),
                child: Container(
                  
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: AppColors.black,blurRadius:0,offset: Offset(0,20) )
                    ],
                    gradient: LinearGradient(
                      colors: [AppColors.themeBlue, AppColors.themePurple],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  width: 170,
                  height: 100,
                  child: Icon(
                    widget.icon,
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
