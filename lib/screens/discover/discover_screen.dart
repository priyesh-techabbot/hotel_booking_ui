import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_ui/model/hotel_model.dart';
import 'package:hotel_booking_ui/screens/discover/widget/home_top_search_view.dart';
import 'package:hotel_booking_ui/screens/discover/widget/hotel_item_view.dart';
import 'package:hotel_booking_ui/services/global_service.dart';
import 'package:hotel_booking_ui/utils/assets_res.dart';
import 'package:hotel_booking_ui/utils/style.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<HotelModel> hotels = [];
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
    hotels.add(HotelModel(
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
    hotels.add(HotelModel(
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
    hotels.add(HotelModel(
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3));
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics()
            .applyTo(const ClampingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopSearchView(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'The most relevant',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: Globals.instance.largeScreen ? 320.h : 220.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var data = hotels[index];
                  return SizedBox(
                    width:
                        Get.width / (Globals.instance.largeScreen ? 1.8 : 1.25),
                    child: HotelItemView(data),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.w);
                },
                itemCount: hotels.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Discover new places nearby Oslo',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: Globals.instance.largeScreen ? 210.w : 140.w,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      popularPlaces[index],
                      width: Globals.instance.largeScreen ? 150.w : 100.w,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 16.w);
                },
                itemCount: popularPlaces.length,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'Best Deals in Oslo',
                style: Style.textStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Globals.instance.largeScreen ? 2 : 1,
                mainAxisExtent: Globals.instance.largeScreen ? 320.h : 220.h,
                crossAxisSpacing: 16.h,
                mainAxisSpacing: 16.h,
              ),
              physics: const NeverScrollableScrollPhysics(),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            SafeArea(top: false, child: SizedBox(height: 60.h)),
          ],
        ),
      ),
    );
  }
}
