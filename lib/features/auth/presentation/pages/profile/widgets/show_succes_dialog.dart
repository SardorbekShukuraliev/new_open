import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../../../core/di/service_locator.dart';
import '../../../../../../core/routes/route_paths.dart' show RoutePaths;
import '../../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../../../core/utils/utils_export.dart';

void showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        backgroundColor: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            spacing: appH(32),
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/congratulations.png",
              ),
              Text(
                AppStrings.congratulations,
                style: sl<UrbanistTextStyles>().bold(color: AppColors.primary.blue500, fontSize: 24),
              ),
              Text(
                AppStrings.accountIsReady,
                textAlign: TextAlign.center,
                style: sl<UrbanistTextStyles>().regular(color: AppColors.greyScale.grey900, fontSize: 16),
              ),
              SpinKitFadingCircle(
                color: AppColors.primary.blue500,
                size: 60.0,
              ),
            ],
          ),
        ),
      );
    },
  );

  Future.delayed(Duration(seconds: 3), () {
    Navigator.of(context).pop();
    context.go(RoutePaths.home);
  });
}
