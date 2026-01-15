import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_elevated_button extends StatelessWidget {
  double? width;
  double? height;

  double? custWidth;

  VoidCallback? onPressed;
  String text;
  // Color? bgColor;
  Color? foregroundColor;
  double? fontSize;
  double? elevation;
  Color? bgColor;
  FontWeight? fontWeight;
  Color? borderColor;
  Icon? suffixIcon;
  bool? isLoading;
  double? borderRadius;
  TextAlign? textAlign;

  WidgetStateProperty<EdgeInsetsGeometry?>? customPadding;



  custom_elevated_button({
    Key? key,
    this.elevation,
    this.onPressed,
    this.borderRadius,
     this.height,
    required this.text,
     this.fontWeight,
    this.bgColor,
    this.width,
    this.borderColor,
    this.isLoading,
    this.textAlign,
    this.suffixIcon,
    this.foregroundColor,
    this.fontSize,
    this.custWidth
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height ?? 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: bgColor ?? Colors.orange,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!)
          )
        ),

        onPressed: onPressed,
        child: isLoading == true ?
            CircularProgressIndicator(
              color: Colors.grey
            ) :
        Row(
          children: [
            if(suffixIcon!=null)
             {
                Icon(suffixIcon!),
             },
            Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: foregroundColor,
              ),
              textAlign: textAlign,
            ),
          ],
        ),
      ),
    );
  }
}
