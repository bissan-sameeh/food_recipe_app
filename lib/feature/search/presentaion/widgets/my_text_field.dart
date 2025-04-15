import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe/core/helper/image_helper.dart';
import 'package:food_recipe/core/styles/colors_manager.dart';

class MyTexField extends StatefulWidget {
  const MyTexField(
      {super.key,
      required this.textEditingController,
      required this.hint,
      this.textColor = Colors.white,
      this.filled = false,
      this.isPrefix = true,
      this.onChanged,
      this.textInputType = TextInputType.text, this.onSubmitted, this.textInputAction=TextInputAction.done});
  final TextEditingController textEditingController;
  final String hint;
  final Color? textColor;
  final bool filled;
  final bool isPrefix;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final void Function(String)? onSubmitted  ;
  final TextInputAction? textInputAction;

  @override
  State<MyTexField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTexField> with ImageHelper{
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.textInputType,
       // autocorrect: true,
       textInputAction: widget.textInputAction,

       // autofocus: true,


      controller: widget.textEditingController,

      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      decoration: InputDecoration
        (



        hintText: widget.hint,
        prefixIconConstraints: const BoxConstraints(),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        prefixIcon: widget.isPrefix
            ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: appSvgImage(path:
                'search',color:
              ColorsManager .black            ),
            )
            : null,
        hintStyle: _textStyle.copyWith(
            color: ColorsManager.lightGray, fontSize: 16.sp),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: ColorsManager.lightGray, width: 0.8.w));
  }

  TextStyle get _textStyle {
    return TextStyle(color: widget.textColor, fontSize: 18.sp);
  }
}
