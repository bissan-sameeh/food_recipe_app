import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.text, this.onTap, });
  final String text;

  final Function()? onTap;
  // final bool? isInternetConnection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: Theme.of(context).textTheme.bodyMedium,),
        SizedBox(height: 12.h,),

          ElevatedButton(

            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor) ),
            onPressed: onTap,
            child:  const Text("Retry",style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
