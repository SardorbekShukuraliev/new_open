import 'package:flutter/material.dart';
import 'package:kursol/core/enums/languages.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../../../core/di/service_locator.dart';
import '../../../../../../core/utils/utils_export.dart';

class LanguageRadioWg extends StatelessWidget {
  final String language;
  final Languages value;
  final Languages? groupValue;
  final void Function(Languages?)? onChanged;

  const LanguageRadioWg({
    super.key,
    required this.language,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: sl<UrbanistTextStyles>().semiBold(
            color: AppColors.greyScale.grey900,
            fontSize: 18,
          ),
        ),
        Radio<Languages>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
