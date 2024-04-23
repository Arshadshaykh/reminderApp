import 'package:flutter/material.dart';

class LineClipper extends CustomClipper<Path> {
  
    @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width,size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height*0.25);
    
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CurvedParallelogramPainter extends CustomClipper<Path> {
  
    @override
  Path getClip(Size size) {
     Path path = Path();
    path.moveTo(size.width*0.2501917,size.height*0.7862286);
    path.cubicTo(size.width*0.1999953,size.height*0.7336947,size.width*0.2743964,size.height*0.3944603,size.width*0.3495374,size.height*0.3347140);
    path.cubicTo(size.width*0.4607779,size.height*0.2504330,size.width*0.6570869,size.height*0.2918176,size.width*0.6961285,size.height*0.3126674);
    path.cubicTo(size.width*0.7711432,size.height*0.3761932,size.width*0.7054782,size.height*0.7221674,size.width*0.6108254,size.height*0.7825436);
    path.cubicTo(size.width*0.5136637,size.height*0.8492189,size.width*0.2935291,size.height*0.8312981,size.width*0.2501917,size.height*0.7862286);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}


class LinePainter extends CustomPainter {
   @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0;
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0 , size.height);
    path.lineTo(0 , size.height*0.25);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
// class RPSCustomPainter extends CustomPainter{
  
//   @override
//   void paint(Canvas canvas, Size size) {
    
    

//   // Layer 1
  
//   Paint paint_fill_0 = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = size.width*0.00
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
     
         
//     Path path_0 = Path();
//     path_0.moveTo(size.width*0.2501917,size.height*0.7862286);
//     path_0.cubicTo(size.width*0.2270167,size.height*0.7624000,size.width*0.2613667,size.height*0.6085286,size.width*0.2960583,size.height*0.5814286);
//     path_0.cubicTo(size.width*0.3474167,size.height*0.5432000,size.width*0.4380500,size.height*0.5619714,size.width*0.4560750,size.height*0.5714286);
//     path_0.cubicTo(size.width*0.4907083,size.height*0.6002429,size.width*0.4603917,size.height*0.7571714,size.width*0.4166917,size.height*0.7845571);
//     path_0.cubicTo(size.width*0.3718333,size.height*0.8148000,size.width*0.2702000,size.height*0.8066714,size.width*0.2501917,size.height*0.7862286);
//     path_0.close();

//     canvas.drawPath(path_0, paint_fill_0);
  

//   // Layer 1
  
//   Paint paint_stroke_0 = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 0
//       ..strokeCap = StrokeCap.butt
//       ..strokeJoin = StrokeJoin.miter;
     
         
    
//     canvas.drawPath(path_0, paint_stroke_0);
  
    
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
  
// }

class NotesCard extends CustomClipper<Path> {
  
    @override
  Path getClip(Size size) {
     Path path = Path();
    path.moveTo(size.width*0.1374929,size.height*0.9924000);
    path.cubicTo(size.width*0.0912941,size.height*0.9956714,size.width*0.0932190,size.height*0.1781143,size.width*0.1374929,size.height*0.1764714);
    path.cubicTo(size.width*0.1317181,size.height*0.1389429,size.width*0.8835902,size.height*-0.0270857,size.width*0.9075024,size.height*0.0132857);
    path.cubicTo(size.width*0.9537013,size.height*0.0312429,size.width*0.9503932,size.height*0.8306286,size.width*0.9075024,size.height*0.8292143);
    path.cubicTo(size.width*0.9033816,size.height*0.8655714,size.width*0.1336430,size.height*1.0299429,size.width*0.1374929,size.height*0.9924000);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}