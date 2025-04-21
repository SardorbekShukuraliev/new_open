import 'package:flutter/material.dart';
import 'package:kursol/core/common/constants/colors/app_colors.dart';
import 'package:kursol/core/common/textstyles/app_textstyles.dart';
import 'package:kursol/core/utils/responsiveness/app_responsive.dart';
import '../../../../../../core/di/service_locator.dart';

class BoardingWidget extends StatelessWidget {
  final String text;
  final Widget image;

  const BoardingWidget({
    super.key,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: appH(60)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: appH(60),
        children: [
          image,
          Text(text,
              textAlign: TextAlign.center,
              style: sl.get<AppTextStyles>().bold(color: AppColors.greyScale.grey900, fontSize: 40))
        ],
      ),
    );
  }
}
