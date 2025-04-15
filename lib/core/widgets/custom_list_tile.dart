import 'package:flutter/material.dart';

import '../styles/styles.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.leading,  this.trailing});
  final String leading;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(leading,style: Theme.of(context).textTheme.bodyMedium,),
        const Spacer(),
        if(trailing !=null ) Text(trailing!,style: trailingListTile(context),),

      ],
    );
  }

}
