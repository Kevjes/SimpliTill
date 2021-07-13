import 'package:flutter/material.dart';
import 'package:simpli_till_test/app/configs/configs.dart';

class MyCustomButton extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? titleColor;
  final IconData? suffixIcon;
  final IconData? preffixIcon;
  final Function? onTap;
  final double radius;
  final double elevation;

  const MyCustomButton(
      {Key? key,
      this.title,
      this.onTap,
      this.suffixIcon,
      this.backgroundColor,
      this.titleColor,
      this.radius = 5,
      this.preffixIcon, this.elevation=3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = this.backgroundColor != null
        ? this.backgroundColor
        : Config.colors.blue;
    Color? titleColor =
        this.titleColor != null ? this.titleColor : Colors.white;
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(this.elevation),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(this.radius),
            ))),
        onPressed: this.onTap as void Function(),
        child: Row(
          children: [
            if (this.preffixIcon != null)
              Icon(this.preffixIcon, size: 17, color: Colors.white),
            if (this.title != null)
              Expanded(
                  child: Center(
                child: Text(
                  this.title!,
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              )),
            if (this.suffixIcon != null)
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Config.colors.red),
                child: Icon(this.suffixIcon, color: Colors.white),
              ),
          ],
        ));
  }
}
