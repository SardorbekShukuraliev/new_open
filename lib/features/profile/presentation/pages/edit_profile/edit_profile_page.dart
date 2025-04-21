import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/common/constants/constants_export.dart';
import '../../../../../core/common/textstyles/urbanist_textstyles.dart';
import '../../../../../core/common/widgets/widgets_export.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/utils/responsiveness/app_responsive.dart';
import '../../../../../core/utils/utils_export.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: ActionAppBarWg(
        onBackPressed: () {
          context.pop();
        },
        titleText: AppStrings.editProfile,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          right: appW(24),
          left: appW(24),
          top: appH(24),
          bottom: appH(48),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: appH(24),
              children: [
                _blankContainer(Text("mr_ss", style: _textStyle)),
                _blankContainer(Text("ss", style: _textStyle)),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("04/20/2025", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.calendar, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("geraklg666@gmail.com", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.message, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("Uzbekistan", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyBold.arrow_down_2, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(
                  Row(
                    children: [
                      Image.asset("assets/images/usa.png"),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, size: appH(20)),
                      ),
                      Text("+998 ** *** ** **", style: _textStyle),
                    ],
                  ),
                ),
                _blankContainer(
                  _rowSpaceBetween([
                    Text("Male", style: _textStyle),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyBold.arrow_down_2, size: appH(20)),
                    ),
                  ]),
                ),
                _blankContainer(Text("15 takam xacker", style: _textStyle)),
              ],
            ),
            DefaultButtonWg(title: AppStrings.update, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget _rowSpaceBetween(List<Widget> widgets) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: widgets);

final _textStyle = sl<UrbanistTextStyles>().semiBold(
  color: AppColors.greyScale.grey900,
  fontSize: 14,
);

Widget _blankContainer(Widget widget) => Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: appW(20)),
      width: double.infinity,
      height: appH(56),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyScale.grey50,
      ),
      child: widget,
    );
