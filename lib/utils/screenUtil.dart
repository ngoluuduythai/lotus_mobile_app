
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilOvr {

  overrideInstance(BuildContext context) {
     return ScreenUtil.instance = ScreenUtil(
      width: 750,
      height: 1334,
      allowFontScaling: false,
    )..init(context);
  }
}