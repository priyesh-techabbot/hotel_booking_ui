import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking_ui/model/hotel_model.dart';
import 'package:hotel_booking_ui/utils/color_res.dart';
import 'package:hotel_booking_ui/utils/style.dart';

class HotelItemView extends StatelessWidget {
  final HotelModel data;
  const HotelItemView(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        color: ColorRes.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
              child: Image.asset(
                data.image.first,
                height: 150.h,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: Style.textStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  '${data.bedInfo.guest} guests • ${data.bedInfo.bedroom} bedroom • ${data.bedInfo.beds} beds • ${data.bedInfo.bathroom} bathroom',
                  style: Style.textStyle(
                    color: ColorRes.grey,
                    fontSize: 11,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [

                          TextSpan(
                            text: '\$${data.offerPrice}  ',
                            style: Style.textStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorRes.black,
                            ),
                          ),
                          TextSpan(
                            text: '\$${data.price}',
                            style: Style.textStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 14,
                              color: ColorRes.errorColor,
                            ),
                          ),
                          TextSpan(
                            text: '  + tax',
                            style: Style.textStyle(
                              fontSize: 10,
                              color: ColorRes.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Total: ',
                            style: Style.textStyle(
                              fontSize: 12,
                              color: ColorRes.black,
                            ),
                          ),
                          TextSpan(
                            text: '\$${data.offerPrice * data.bedInfo.bedroom}',
                            style: Style.textStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorRes.successColor,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                            text: '  + tax',
                            style: Style.textStyle(
                              fontSize: 10,
                              color: ColorRes.lightGrey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
