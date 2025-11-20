import 'package:flutter/material.dart';

import '../../../core/design/app_colors.dart';

class DividertItem extends StatelessWidget {
  const DividertItem({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Divider(
      color: AppColors.whiteColor,
      thickness: 2,
      indent: width*0.04,
      endIndent: width*0.04,
    );
  }
}
