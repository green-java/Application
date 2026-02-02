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
  Color? backgroundColor;
  double? fontSize;
  double? elevation;
  Color? bgColor;
  FontWeight? fontWeight;
  Color? borderColor;
  Widget? suffixIcon;
  bool? isLoading;
  double? borderRadius;
  TextAlign? textAlign;

  WidgetStateProperty<EdgeInsetsGeometry?>? customPadding;



  custom_elevated_button({
    Key? key,
    this.elevation,
    this.onPressed,
    this.borderRadius,
    this.backgroundColor,
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

    return SizedBox(
      width: width,
      height: height ?? 40,

      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 10,vertical: 0),),
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.white),
          elevation: MaterialStateProperty.all(elevation ?? 0),
          alignment: Alignment.center,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.white,width: 1),
            borderRadius: BorderRadius.circular(borderRadius ?? 0)
          ),),
        ),

        onPressed: onPressed,
        child: isLoading == true ?
            CircularProgressIndicator(
              color: Colors.grey
            ) :
        Row(
          children: [
            if(suffixIcon!=null)
              ...[
                suffixIcon!
              ],
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
