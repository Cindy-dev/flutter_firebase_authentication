import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*-0.4583333,size.height*0.8787550);
    path_0.cubicTo(size.width*-0.2194444,size.height*1.020973,size.width*0.3862972,size.height*1.001304,size.width*0.5635778,size.height*0.9346695);
    path_0.cubicTo(size.width*0.5789111,size.height*0.9289060,size.width*0.5941750,size.height*0.9230503,size.width*0.6094000,size.height*0.9172097);
    path_0.cubicTo(size.width*0.7338611,size.height*0.8694648,size.width*0.8556556,size.height*0.8227433,size.width*0.9897444,size.height*0.8361174);
    path_0.cubicTo(size.width*0.9936167,size.height*0.8365034,size.width*0.9974972,size.height*0.8369396,size.width*1.001389,size.height*0.8374279);
    path_0.lineTo(size.width*1.001389,0);
    path_0.lineTo(size.width*-0.009722222,0);
    path_0.lineTo(size.width*-0.009722222,size.height*0.9815654);
    path_0.lineTo(size.width*-0.2125000,size.height*0.9587131);
    path_0.lineTo(size.width*-0.3569444,size.height*0.9234631);
    path_0.lineTo(size.width*-0.4583333,size.height*0.8787550);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff5DF99B).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.5635778,size.height*0.9346695);
    path_1.cubicTo(size.width*0.7722278,size.height*0.8761057,size.width*0.8997444,size.height*0.8603607,size.width*1.001389,size.height*0.8787550);
    path_1.lineTo(size.width*1.001389,size.height*0.8374279);
    path_1.cubicTo(size.width*0.9974972,size.height*0.8369396,size.width*0.9936167,size.height*0.8365034,size.width*0.9897444,size.height*0.8361174);
    path_1.cubicTo(size.width*0.8556556,size.height*0.8227433,size.width*0.7338611,size.height*0.8694648,size.width*0.6094000,size.height*0.9172097);
    path_1.cubicTo(size.width*0.5941750,size.height*0.9230503,size.width*0.5789111,size.height*0.9289060,size.width*0.5635778,size.height*0.9346695);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color =
       const Color(0xff27EB75).withOpacity(0.86);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}