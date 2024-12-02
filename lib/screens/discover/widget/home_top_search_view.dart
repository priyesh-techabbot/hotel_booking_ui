import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_ui/services/global_service.dart';
import 'package:hotel_booking_ui/utils/assets_res.dart';
import 'package:hotel_booking_ui/utils/color_res.dart';
import 'package:hotel_booking_ui/utils/style.dart';

class HomeTopSearchView extends StatelessWidget {
  const HomeTopSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.r),
        bottomRight: Radius.circular(40.r),
      ),
      child: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              ColorRes.black.withOpacity(0.4),
              BlendMode.darken,
            ),
            child: Image.asset(
              AssetsRes.homeBg,
              height: Globals.instance.largeScreen ? 190.h : 205.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.navigation,
                              size:
                                  Globals.instance.largeScreen ? 16.sp : 14.sp,
                              color: ColorRes.white,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'Oslo, Norway',
                              style: Style.textStyle(
                                color: ColorRes.white,
                                fontSize:
                                    Globals.instance.largeScreen ? 14 : 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        AssetsRes.user,
                        height: Globals.instance.largeScreen ? 25.h : 20.h,
                        color: ColorRes.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Hey Martin, Tell us where you want to go',
                    style: Style.textStyle(
                      color: ColorRes.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(90.r),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRes.white.withOpacity(0.2),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 6.h,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsRes.search,
                              color: ColorRes.white,
                              height: 16.h,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Search places',
                                    style: Style.textStyle(
                                      color: ColorRes.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Date range • Number of guest',
                                    style: Style.textStyle(
                                      color: ColorRes.ultraLightGrey,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
