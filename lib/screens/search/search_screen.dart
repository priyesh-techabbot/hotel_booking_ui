import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_ui/model/hotel_model.dart';
import 'package:hotel_booking_ui/screens/discover/widget/hotel_item_view.dart';
import 'package:hotel_booking_ui/services/global_service.dart';
import 'package:hotel_booking_ui/utils/assets_res.dart';
import 'package:hotel_booking_ui/utils/color_res.dart';
import 'package:hotel_booking_ui/utils/style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RxInt imageIndex = RxInt(0);

  List<HotelModel> hotels2 = [];
  List<String> popularPlaces = [
    AssetsRes.popular1,
    AssetsRes.popular2,
    AssetsRes.popular4,
    AssetsRes.popular5,
    AssetsRes.popular6,
    AssetsRes.popular3,
  ];

  @override
  void initState() {
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel4,
        AssetsRes.room1,
        AssetsRes.room2,
        AssetsRes.lobby1,
        AssetsRes.bathroom1,
        AssetsRes.lobby2,
        AssetsRes.lobby3,
        AssetsRes.bathroom2,
      ],
      name: 'The Grand Rio Hotel - Oslo',
      price: 450,
      offerPrice: 400,
      review: 120,
      rating: 4.9,
      bedInfo: BedInfoModel(bedroom: 2, beds: 3, guest: 5, bathroom: 2),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel5,
        AssetsRes.lobby2,
        AssetsRes.room2,
        AssetsRes.bathroom1,
        AssetsRes.lobby3,
        AssetsRes.room1,
        AssetsRes.lobby1,
        AssetsRes.bathroom2,
      ],
      name: 'Best Western Hotels Resorts & Spa',
      price: 480,
      offerPrice: 420,
      review: 380,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 2, beds: 2, guest: 4, bathroom: 4),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel6,
        AssetsRes.lobby1,
        AssetsRes.lobby3,
        AssetsRes.lobby2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Choice Hotels International',
      price: 830,
      offerPrice: 650,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 3, beds: 4, guest: 7, bathroom: 3),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.lobby3,
        AssetsRes.lobby1,
        AssetsRes.hotel3,
        AssetsRes.lobby2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Choice Hotels International',
      price: 830,
      offerPrice: 650,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 3, beds: 4, guest: 7, bathroom: 3),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel1,
        AssetsRes.room1,
        AssetsRes.room2,
        AssetsRes.lobby1,
        AssetsRes.bathroom1,
        AssetsRes.lobby2,
        AssetsRes.lobby3,
        AssetsRes.bathroom2,
      ],
      name: 'The Grand Rio Hotel - Oslo',
      price: 450,
      offerPrice: 400,
      review: 120,
      rating: 4.9,
      bedInfo: BedInfoModel(bedroom: 2, beds: 3, guest: 5, bathroom: 2),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel2,
        AssetsRes.lobby2,
        AssetsRes.room2,
        AssetsRes.bathroom1,
        AssetsRes.lobby3,
        AssetsRes.room1,
        AssetsRes.lobby1,
        AssetsRes.bathroom2,
      ],
      name: 'Best Western Hotels Resorts & Spa',
      price: 480,
      offerPrice: 420,
      review: 380,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 2, beds: 2, guest: 4, bathroom: 4),
    ));
    hotels2.add(HotelModel(
      image: [
        AssetsRes.hotel3,
        AssetsRes.lobby1,
        AssetsRes.lobby3,
        AssetsRes.lobby2,
        AssetsRes.room2,
        AssetsRes.room1,
        AssetsRes.bathroom2,
        AssetsRes.bathroom1,
      ],
      name: 'Choice Hotels International',
      price: 830,
      offerPrice: 650,
      review: 80,
      rating: 4.8,
      bedInfo: BedInfoModel(bedroom: 3, beds: 4, guest: 7, bathroom: 3),
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.r),
        topRight: Radius.circular(30.r),
      ),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 3));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: EdgeInsets.all(4.h),
                        child: Image.asset(
                          AssetsRes.close,
                          height: 18.sp,
                          color: ColorRes.black,
                        ),
                      ),
                    ),
                    Text(
                      'Search',
                      style: Style.textStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Image.asset(
                      AssetsRes.filter,
                      height: 18.sp,
                      color: ColorRes.black,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorRes.white,
                  borderRadius: BorderRadius.circular(90.r),
                ),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsRes.search,
                      color: ColorRes.black,
                      height: 18.sp,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Oslo, Norway',
                            style: Style.textStyle(
                              color: ColorRes.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '18 - 21 Oct • 4 guests',
                            style: Style.textStyle(
                              color: ColorRes.grey,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Globals.instance.largeScreen ? 2 : 1,
                    mainAxisExtent:
                        Globals.instance.largeScreen ? 320.h : 220.h,
                    crossAxisSpacing: 16.h,
                    mainAxisSpacing: 16.h,
                  ),
                  physics: const AlwaysScrollableScrollPhysics()
                      .applyTo(const ClampingScrollPhysics()),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var data = hotels2[index];
                    return SizedBox(
                      width: double.maxFinite,
                      height: Globals.instance.largeScreen ? 320.h : 220.h,
                      child: HotelItemView(data),
                    );
                  },
                  itemCount: hotels2.length,
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
