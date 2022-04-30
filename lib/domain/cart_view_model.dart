import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zarcony/data/cart.dart';

class CartViewModel extends ChangeNotifier{
  double _total=0.0;
  int _count=0;
  List<Cart> _cartsList=[];

  List<Cart> get cartsList => _cartsList;

  int get count => _count;

  double get total => _total;

  CartViewModel(){
    getAllFavourites();
  }

  void getAllFavourites(){
   _cartsList.clear();
   notifyListeners();
   _cartsList=[
      Cart(
          title: "Turkish Steak",
          price: 30.0,
          desc: "1 bottle",
          color: const Color(0xffF9BDAD),
          count: 1
      ),
      Cart(
          title: "Salmon",
          price:39.0,
          desc: "1 bottle",
          color: const Color(0xffB0EAFD),
          count: 2

      ),
      Cart(
          title: "Red Juice",
          price:60.0,
          desc: "1 bottle",
          color: const Color(0xffFF9DC2),
          count: 2
      ),
      Cart(
          title: "Cola",
          price: 11.0,
          desc: "1 bottle",
          color: const Color(0xffCCB8FF),
          count: 2
      ),
    ];
   calculateTotal(_cartsList);
   notifyListeners();
  }
  void sumAllTotal(int count,double unitPrice){
    print("countIs$count unitPrice$unitPrice");

    _count=count;
    _total+=(unitPrice);
    notifyListeners();
  }
  void minusAllTotal(int count,double unitPrice){
    print("countIs$count unitPrice$unitPrice");
    _count=count;
    _total-=(unitPrice);
    notifyListeners();
  }
  void calculateTotal(List<Cart>carts){
    for(int i=0;i<carts.length;i++){
      _total+=(carts[i].count*carts[i].price!);
    }
    notifyListeners();
  }


}