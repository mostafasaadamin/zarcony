

import 'package:flutter/material.dart';
import 'package:zarcony/data/deals.dart';
class HomeViewModel extends ChangeNotifier{
   List<Deals> _favouritesDeals=[];
   bool addedToFavourites=false;
  List<Deals> get favouritesDeals => _favouritesDeals;
  void addDealsToFavourite(Deals deals){
    addedToFavourites=deals.favourite;
  _favouritesDeals.add(deals);
  notifyListeners();
}
}