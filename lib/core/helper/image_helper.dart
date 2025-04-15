import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ImageHelper {
  Widget appCacheImage(String link,
      {double? height, double? width, BoxFit fit = BoxFit.cover}) {
    return CachedNetworkImage(
      imageUrl: link,
      height: height,
      width: width,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration:  BoxDecoration(color: Colors.grey.shade400),),

       errorWidget : (context, url, error) => Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(color: Colors.grey.shade400),
          // لون أو أي صورة أخرى
          // child: const Icon(Icons.error, color: Colors.white), // أيقونة خطأ
        ),
    );
  }

  Widget appSvgImage(
      {required String path, double? width, double? height, Color? color,BoxFit? box}) {
    return SvgPicture.asset(
      "assets/icons/$path.svg",
      width: width,
      height: height,

      fit: box??BoxFit.cover,

      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  Widget fancyShimmer({
    required String imagePath,double width=40,double height=40
  }){
    return  FancyShimmerImage(
        shimmerBaseColor: Colors.grey.shade400,
        shimmerHighlightColor: Colors.grey.shade50,
        imageUrl: imagePath ,width: width.w,
        boxFit: BoxFit.cover,
        height: width.h,
        errorWidget: const Icon(Icons.close,color: Colors.redAccent,)
    );
  }
}
