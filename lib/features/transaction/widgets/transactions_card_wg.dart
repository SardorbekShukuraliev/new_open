import 'package:flutter/material.dart';

import '../../../core/common/constants/constants_export.dart';
import '../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../core/common/widgets/widgets_export.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/utils/responsiveness/app_responsive.dart';
import '../../../core/utils/utils_export.dart';

class TransactionsCardWg extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onButtonPressed;
  final String courseImg;
  final String title;

  const TransactionsCardWg({
    super.key,
    required this.onTap,
    required this.courseImg,
    required this.title,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCardWg(
      onTap: onTap,
      courseImg: courseImg,
      mainWidgets: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: sl<UrbanistTextStyles>().bold(
            color: AppColors.black,
            fontSize: 18,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: appH(24),
          width: appW(41),
          decoration: BoxDecoration(
            color: AppColors.primary.blue100,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            "Paid", // dummy  code
            style: sl<UrbanistTextStyles>().semiBold(
              color: AppColors.primary(),
              fontSize: 10,
            ),
          ),
        ),
      ],
      trailingWidget: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary(),
          padding: EdgeInsets.symmetric(
            horizontal: appW(16),
            vertical: appH(6),
          ),
        ),
        onPressed: onButtonPressed,
        child: Text(
          AppStrings.eReceipt,
          style: sl<UrbanistTextStyles>().semiBold(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
