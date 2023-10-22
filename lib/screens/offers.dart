import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//models
import 'package:mobile_banking_app/models/offers.dart';

//widget
import 'package:mobile_banking_app/widgets/primary_appbar.dart';
import 'package:mobile_banking_app/widgets/bottom_navbar.dart';
import 'package:mobile_banking_app/widgets/search_bar.dart';

class OfferScreen extends StatelessWidget{
  late String activeUser;
  
  List<Offers> offerList = [
    Offers(brandName: "Nike", couponCode: "Apply Code: FLAT20", discount: "20%"),
    Offers(brandName: "Apple", couponCode: "Apply Code: BIG_SALE", discount: "5%"),
    Offers(brandName: "MSI Laptop", couponCode: "Apply Code: LAPTOP2023", discount: "23%"),
    Offers(brandName: "Walton", couponCode: "Apply Code: TV30", discount: "30%"),
    Offers(brandName: "Samsung TV", couponCode: "Apply Code: FLAT20", discount: "20%"),
    Offers(brandName: "Nikon", couponCode: "Apply Code: CAM10", discount: "10%"),
    Offers(brandName: "Vision", couponCode: "Apply Code: EYE2023", discount: "23%"),
    Offers(brandName: "HP", couponCode: "Apply Code: GAMING5", discount: "5%"),
  ];
  
  OfferScreen({super.key, required this.activeUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppBar(activeUser),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              Text("Offers", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 1.h),
              appSearchBar(context, "Search Offers, Coupons & many more..."),
              SizedBox(height: 3.h),
              Text("Today's Offers", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 1.h),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: offerList.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        title: Text(offerList[index].brandName, style: Theme.of(context).textTheme.bodyLarge),
                        subtitle: Text(offerList[index].couponCode, style: Theme.of(context).textTheme.bodySmall),
                        trailing: Text(offerList[index].discount, style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2, activeUserProfilePic: activeUser),
    );
  }

}