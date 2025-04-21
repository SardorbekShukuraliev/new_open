import 'package:flutter/material.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';

import '../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../core/di/service_locator.dart';

class FinishTestButton extends StatelessWidget {
  final VoidCallback onPressed;

  const FinishTestButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appH(58),
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(appH(30)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          "Finish Test",
          style: sl<UrbanistTextStyles>().bold(
            color: AppColors.white,
            fontSize: appH(16),
          ),
        ),
      ),
    );
  }
}
