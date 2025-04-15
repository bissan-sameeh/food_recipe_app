import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle trailingListTile(BuildContext context) => TextStyle(
    fontSize: 14.sp,
    color: Theme.of(context).colorScheme.secondary,
    fontWeight: FontWeight.bold);

BorderRadiusDirectional get buildBorderRadiusDirectional =>
    BorderRadiusDirectional.circular(16.r);

Radius get cornerDetails=>Radius.circular(15.r);

BoxShadow boxShadow() => const BoxShadow(
    color: Color(0xff063336),
    spreadRadius: 0,
    blurRadius: 2,
    offset: Offset(0, 1));
