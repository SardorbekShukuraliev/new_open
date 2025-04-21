import 'package:flutter/material.dart';
import 'package:kursol/core/common/textstyles/urbanist_textstyles.dart';

import '../../di/service_locator.dart';
import '../../utils/responsiveness/app_responsive.dart';
import '../constants/colors/app_colors.dart';

class SecondaryButtonWg extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SecondaryButtonWg({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(58),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary.blue100,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: sl<UrbanistTextStyles>().bold(
            color: AppColors.primary(),
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
