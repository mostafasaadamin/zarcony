
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/data/address.dart';
import 'package:zarcony/elements/general_text_view.dart';

class AddressCard extends StatelessWidget {
  Address address;

  AddressCard(this.address);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        border: Border.all(width: 1,color:Colors.grey.withOpacity(0.5)),
        color: Colors.white.withOpacity(1.0),
        borderRadius:const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Color.fromRGBO(72, 72, 72, 0.05),blurRadius: 8,offset: Offset(0,2)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration:  BoxDecoration(
                border: Border.all(width: 1,color:const Color(0xffF8F8F8)),
                color: const Color(0xffE3DDD6),
                borderRadius:const BorderRadius.all(Radius.circular(12)),
              ),

            ),
            SizedBox(width: 5.w,),
            Column(
              children: [
                VooTextView(
                  color: Colors.black,
                  fontFamily: "dinBold",
                  fontSize: 14.sp,
                  isBold: false,
                  text:address.title!,
                  overflow: true,
                ),
                SizedBox(width: 5.w,),
                VooTextView(
                  color: Colors.black,
                  fontFamily: "din",
                  fontSize: 10.sp,
                  isBold: false,
                  text:address.address!,
                  overflow: true,
                ),
                SizedBox(width: 5.w,),
                VooTextView(
                  color: Colors.black,
                  fontFamily: "din",
                  fontSize: 10.sp,
                  isBold: false,
                  text:address.floor!,
                  overflow: true,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
