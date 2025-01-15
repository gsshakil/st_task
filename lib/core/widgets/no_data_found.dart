import 'package:st_task/core/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataFound extends StatelessWidget {
  const NoDataFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtil().screenWidth / 1.5,
      child: Image.asset(
        AssetConstants.noDataFound,
      ),
    );
  }
}
