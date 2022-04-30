import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/data/deals.dart';
import 'package:zarcony/domain/home_view_model.dart';
import 'package:zarcony/elements/general_text_view.dart';

class DealsCard extends StatelessWidget {
  Deals deals;

  DealsCard(this.deals);

  @override
  Widget build(BuildContext context) {
    final homeProvider = ChangeNotifierProvider((ref) => HomeViewModel());

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 110.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: deals.color,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                Positioned(
                  top: -1,
                  left: -1,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: Consumer(builder: (context, ref, child) {
                      final dealsNotifier = ref.watch(homeProvider);
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: GestureDetector(
                              onTap: () {
                                deals.favourite = !deals.favourite;
                                ref
                                    .read(homeProvider)
                                    .addDealsToFavourite(deals);
                              },
                              child: Icon(
                                dealsNotifier.addedToFavourites
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: dealsNotifier.addedToFavourites
                                    ? Colors.red
                                    : Colors.grey.withOpacity(0.5),
                                size: 13,
                              )),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: VooTextView(
                    color: Colors.black,
                    fontFamily: "dinBold",
                    fontSize: 13.sp,
                    isBold: false,
                    text: deals.title!,
                    overflow: true,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: VooTextView(
                    color: Colors.black,
                    fontFamily: "din",
                    fontSize: 10.sp,
                    isBold: false,
                    text: deals.desc,
                    overflow: true,
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.grey,
                      size: 12,
                    ),
                    SizedBox(
                      width: 0.h,
                    ),
                    VooTextView(
                      color: Colors.black,
                      fontFamily: "din",
                      fontSize: 10.sp,
                      isBold: false,
                      text: deals.address,
                      overflow: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Row(
                    children: [
                      VooTextView(
                        color: const Color(0xffEE6B62),
                        fontFamily: "dinmedium",
                        fontSize: 13.sp,
                        isBold: false,
                        text: deals.price,
                        overflow: true,
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      VooTextView(
                        color: Colors.grey.withOpacity(0.5),
                        fontFamily: "dinmedium",
                        fontSize: 13.sp,
                        isBold: false,
                        text: deals.discount,
                        overflow: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
