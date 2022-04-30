
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/data/cart.dart';
import 'package:zarcony/domain/cart_view_model.dart';
import 'package:zarcony/elements/general_text_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CartItemsCard extends StatelessWidget {
  Cart carts;
  var _cartViewModel;
  CartItemsCard(this.carts,this._cartViewModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 70.w,
                      height: 60.h,
                      decoration:  BoxDecoration(
                        color: carts.color,
                        borderRadius:const BorderRadius.all(Radius.circular(12)),
                      ),

                    ),
                  ],
                ),
                SizedBox(width: 18.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:4.0),
                      child: VooTextView(
                        color: Colors.black,
                        fontFamily: "dinBold",
                        fontSize: 13.sp,
                        isBold: false,
                        text:carts.title!,
                        overflow: true,
                      ),
                    ),
                    SizedBox(height: 6.h,),
                    Padding(
                      padding: const EdgeInsets.only(left:4.0),
                      child: VooTextView(
                        color: Colors.black,
                        fontFamily: "din",
                        fontSize: 10.sp,
                        isBold: false,
                        text:carts.desc!,
                        overflow: true,
                      ),
                    ),
                    SizedBox(height: 6.h,),
                    Row(
                      children: [
                        VooTextView(
                          color: const Color(0xffB4455B),
                          fontFamily: "din",
                          fontSize: 17.sp,
                          isBold: false,
                          text:carts.price.toString(),
                          overflow: true,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 15.w,),
              ],
            ),

    Consumer(builder: (context, ref, child) {
      return Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xffB0EAFD),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(child: GestureDetector(
                onTap: () {
                  int count = 1;
                  if (carts.count > 0) {
                    count = --carts.count;
                    ref.read(_cartViewModel).minusAllTotal(count, carts.price!);
                  }
                },
                child: const Icon(Icons.minimize_rounded,
                  color: Color(0xff48B6DA),))),
          ),
          SizedBox(width: 8.w,),

          VooTextView(
            color: Colors.black,
            fontFamily: "dinBold",
            fontSize: 16.sp,
            isBold: false,
            text: carts.count.toString(),
            overflow: true,
          ),
          SizedBox(width: 8.w,),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Color(0xffB0EAFD),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(child: GestureDetector(
                onTap: () {
                  int count;
                  count = ++carts.count;
                  ref.read(_cartViewModel).sumAllTotal(count, carts.price!);
                },
                child: Icon(Icons.add, color: Color(0xff48B6DA),))),
          ),
        ],
      );
    })
          ],
        ),
      ),
    );
  }
}
