import 'package:flutter/material.dart';

import '../../../../../../core/common/constants/constants_export.dart';
import '../../../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../../../core/di/service_locator.dart';
import '../../../../../../core/utils/utils_export.dart';

Widget buildTextField(String label, {IconData? suffixIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.greyScale.grey50,
          hintText: label,
          hintStyle: sl<UrbanistTextStyles>().regular(
            color: AppColors.greyScale.grey500,
            fontSize: 14,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
          suffixIconColor: AppColors.greyScale.grey500),
      style: sl<UrbanistTextStyles>().semiBold(
        color: AppColors.greyScale.grey900,
        fontSize: 14,
      ),
    ),
  );
}
