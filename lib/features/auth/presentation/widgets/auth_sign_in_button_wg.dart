import 'package:flutter/cupertino.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/utils_export.dart';

class AuthSignInButtonWg extends StatelessWidget {
  final Widget image;
  final String text;
  final VoidCallback onTap;

  const AuthSignInButtonWg(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: appH(60),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.greyScale.grey200),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: appW(12),
          children: [
            image,
            Text(
              text,
              style: sl<UrbanistTextStyles>().semiBold(color: AppColors.greyScale.grey900, fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
