import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kursol/core/common/sizes/sizes.dart';
import 'package:kursol/core/routes/route_paths.dart';

import '../../../../core/common/constants/constants_export.dart';
import '../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../core/utils/utils_export.dart';

void showLogoutModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
    ),
    backgroundColor: AppColors.white,
    builder: (context) => Padding(
      padding: scaffoldPadding48,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: appH(20),
        children: [
          Text(
            AppStrings.logOut,
            style: sl<UrbanistTextStyles>().bold(
              color: AppColors.red,
              fontSize: 24,
            ),
          ),
          Divider(thickness: 1, color: AppColors.greyScale.grey200),
          Text(
            AppStrings.wantToLogOut,
            style: sl<UrbanistTextStyles>().bold(
              color: AppColors.greyScale.grey800,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: appH(54),
                  child: FilledButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary.blue100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.cancel,
                      style: sl<UrbanistTextStyles>().bold(
                        color: AppColors.primary(),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: appW(12)),
              Expanded(
                child: SizedBox(
                  height: appH(54),
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(RoutePaths.signin);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      AppStrings.yesLogOut,
                      style: sl<UrbanistTextStyles>().bold(
                        color: AppColors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
