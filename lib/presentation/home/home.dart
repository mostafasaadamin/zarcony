

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/change_notifier_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/data/address.dart';
import 'package:zarcony/data/category.dart';
import 'package:zarcony/data/deals.dart';
import 'package:zarcony/domain/cart_view_model.dart';
import 'package:zarcony/elements/general_text_view.dart';
import 'package:zarcony/elements/profile_widget.dart';
import 'package:zarcony/elements/search_bar.dart';
import 'package:zarcony/presentation/cart/cart_screen.dart';
import 'package:zarcony/presentation/home/home_elements/address_card.dart';
import 'package:zarcony/presentation/home/home_elements/category_card.dart';
import 'package:zarcony/presentation/home/home_elements/deals_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Address> addressList=[
    Address(
      title: "Home Address",
      floor:"street x12" ,
      address:"Mustafa street"
    ),
    Address(
        title: "Office Address",
        floor:"street x12" ,
        address:"Axis istanbul B2 block"
    ),
    Address(
        title: "Home Address",
        floor:"street x12" ,
        address:"Mustafa street"
    )
  ];
  List<Category> categoryList=[
    Category(
        title: "Steak",
        color:const Color(0xffEBB2A3) ,
        id: 1
    ),
    Category(
       id: 2,
        title: "Vegetable",
        color:const Color(0xffAFE9FC) ,

    ),
    Category(
        id: 3,
        title: "Beverage",
        color:const Color(0xffC7B3F8) ,

    ),
    Category(
      id: 4,
      title: "Fish",
      color:const Color(0xffF5D56B) ,

    ),
    Category(
      id: 5,
      title: "juice",
      color:const Color(0xffEBB2A3) ,

    ),
  ];
  List<Deals> dealsList=[
    Deals(
      address:"15 minutes away" ,
      color:const Color(0xffFBEDD8) ,
      desc:"Piece 5" ,
      discount: "\$ 13",
      favourite:false ,
      id:1 ,
      price: "\$ 12 ",
      title:"Summer sun Ice Cream peak"
    ),
    Deals(
        address:"15 minutes away" ,
        color:const Color(0xffCFF5E7) ,
        desc:"Piece 5" ,
        discount: "\$ 13",
        favourite:true ,
        id:2,
        price: "\$ 12 ",
        title:"Summer sun Ice Cream peak"
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35.h,),
              Padding(
                padding: const EdgeInsets.only(left:0.0,right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        decoration:  const BoxDecoration(
                          color: Color(0xffEE6A61),
                          borderRadius:BorderRadius.only(
                              topRight: Radius.circular(150),
                              bottomLeft:Radius.circular(50) ,
                              bottomRight:Radius.circular(35) ,
                              topLeft:Radius.circular(50) ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              VooTextView(
                                color: Colors.white,
                                fontFamily: "din",
                                fontSize: 16.sp,
                                isBold: false,
                                text:"Mustafa St.",
                                overflow: false,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                      },
                      child: ProfileWidget(imageUrl: "",onClicked: (){},isEdit: false,),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              SearchBarWidget(),
               SizedBox(height: 25.h,),
               SizedBox(
            height: 50.h,
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 10.w);
              },
              itemCount: addressList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AddressCard(addressList[index]);
              },
            ),
          ),
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VooTextView(
                        color: Colors.black,
                        fontFamily: "dinmedium",
                        fontSize: 15.sp,
                        isBold: false,
                        text:"Explore by Category",
                        overflow: false,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: VooTextView(
                          color: Colors.grey.withOpacity(0.7),
                          fontFamily: "din",
                          fontSize: 12.sp,
                          isBold: false,
                          text:"See All (36)",
                          overflow: false,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14.h,),
              SizedBox(
                height: 100.h,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 10.w);
                  },
                  itemCount: categoryList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryCard(categoryList[index]);
                  },
                ),
              ),
              SizedBox(height: 14.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      VooTextView(
                        color: Colors.black,
                        fontFamily: "dinmedium",
                        fontSize: 15.sp,
                        isBold: false,
                        text:"Deals of the day",
                        overflow: false,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14.h,),
              SizedBox(
                height: 90.h,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: 12.w);
                  },
                  itemCount: dealsList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return DealsCard(dealsList[index]);
                  },
                ),
              ),
              SizedBox(height: 14.h,),
             Container(
               decoration:  const BoxDecoration(
                 color: Color(0xffFEC8BD),
                 borderRadius:BorderRadius.all(Radius.circular(12)),
               ),
      child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: VooTextView(
                    color: const Color(0xffE88374),
                    fontFamily: "din",
                    fontSize: 10.sp,
                    isBold: false,
                    text:"mega",
                    overflow: true,
                  ),
                ),
                SizedBox(height: 4.h,),
                Row(
                  children: [
                    VooTextView(
                      color: const Color(0xff21114B),
                      fontFamily: "din",
                      fontSize: 20.sp,
                      isBold: true,
                      text:"WHOPP",
                      overflow: true,
                    ),
                    SizedBox(width: 0.h,),
                    VooTextView(
                      color: const Color(0xffD13A27),
                      fontFamily: "din",
                      fontSize: 20.sp,
                      isBold: true,
                      text:"E",
                      overflow: true,
                    ),
                    VooTextView(
                      color: const Color(0xff21114B),
                      fontFamily: "din",
                      fontSize: 20.sp,
                      isBold: true,
                      text:"R",
                      overflow: true,
                    ),
                  ],
                ),
                SizedBox(height: 6.h,),
                Padding(
                  padding: const EdgeInsets.only(left:4.0),
                  child: Row(
                    children: [
                      VooTextView(
                        color: const Color(0xffEE6B62),
                        fontFamily: "dinmedium",
                        fontSize: 18.sp,
                        isBold: false,
                        text:"\$ 17",
                        overflow: true,
                      ),
                      SizedBox(width: 8.w,),
                      VooTextView(
                        color: Colors.white,
                        fontFamily: "dinmedium",
                        fontSize: 18.sp,
                        isBold: false,
                        text:"\$ 32",
                        overflow: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h,),
                VooTextView(
                  color: Colors.white,
                  fontFamily: "din",
                  fontSize: 12.sp,
                  isBold: false,
                  text:"available till 24 Mars 2029",
                  overflow: true,
                ),
              ],
            ),

          ],
      ),
    ),
    )


    ],
          ),
        ),
      ),
    );
  }
}
