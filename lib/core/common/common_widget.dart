
import 'package:flutter/material.dart';
import 'package:pokemony/core/theme/app_colors.dart';

class CommonWidgets {
  static Widget appTextField({
    TextEditingController? controller,
    String? hintText,
    String? labelText,
    bool obscureText = false,
    Widget? prefix,
    Widget? suffix,
    String? Function(String? value)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            prefixIcon: prefix,
            suffixIcon: suffix,
            hintText: hintText,
            label: labelText == null
                ? null
                : appText(
                    labelText,
                    fontWeight: FontWeight.bold,
                  ),
            fillColor: Colors.blueGrey,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: Colors.grey.shade800,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// Default button
  static Widget appButton({
    required String title,
    VoidCallback? onTap,
    bool isIcon = false,
    bool outline = false,
    bool shadow = true,
    Color backgroundColor = kMainColor,
    Color? textColor,
    Color borderColor = kMainColor,
    double fontSize = 16,
    double? width,
    double height = 48,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          color: outline ? Colors.transparent : backgroundColor,
          border: outline
              ? Border.all(
                  color: borderColor,
                )
              : null,
          boxShadow: shadow
              ? <BoxShadow>[
                  BoxShadow(
                    color: backgroundColor.withOpacity(.45),
                    offset: const Offset(0, 10),
                    blurRadius: 15,
                  ),
                ]
              : <BoxShadow>[],
        ),
        child: Center(
          child: appText(
            title,
            fontSize: fontSize,
            // ignore: prefer_if_null_operators
            color: textColor != null
                ? textColor
                : outline
                    ? backgroundColor
                    : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static Widget appText(
    String data, {
    Color? color,
    double fontSize = 13,
    double? height,
    int? maxLines,
    FontWeight? fontWeight,
  }) {
    return Text(
      data,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? kMainTextColor,
        fontFamily: 'Roboto',
        
        fontSize: fontSize,
        letterSpacing: 0,
        fontWeight: fontWeight,
        height: height ?? 1.5384615384615385,
      ),
    );
  }

  static Widget appSeparator({
    double height = 1,
    Color color = Colors.grey,
    double dashWidth = 4.0,
  }) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double boxWidth = constraints.constrainWidth();
        final double dashHeight = height;
        final int dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List<Widget>.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
