import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/domain/cart_view_model.dart';
import 'package:zarcony/elements/general_text_view.dart';
import 'package:zarcony/elements/profile_widget.dart';
import 'package:zarcony/presentation/home/home_elements/cart_items_card.dart';
class CartScreen extends StatefulWidget {
  var cartProvider;
  CartScreen(this.cartProvider);

  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
 // late  var homeProvider=ChangeNotifierProvider<CartViewModel>((ref) => CartViewModel());

  @override
  void initState() {
    super.initState();
  }
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
                    Container(
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
                              text:"Oxfford st.",
                              overflow: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ProfileWidget(imageUrl: "",onClicked: (){},isEdit: false,)
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    VooTextView(
                      color: Colors.black,
                      fontFamily: "dinmedium",
                      fontSize: 20.sp,
                      isBold: false,
                      text:"Cart",
                      overflow: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h,),
              Consumer(
                builder: (context,ref,child){
                  final cartNotifier = ref.watch(widget.cartProvider);
                  return SizedBox(
                    height: MediaQuery.of(context).size.height*.8,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 18.w);
                      },
                      itemCount: cartNotifier.cartsList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return CartItemsCard(cartNotifier.cartsList[index],widget.cartProvider);
                      },
                    ),
                  );
                }),
            ],
          ),
        ),
      ),
    );

  }
}
