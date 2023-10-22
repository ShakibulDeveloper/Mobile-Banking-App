import 'package:flutter/material.dart';

//models
import 'package:mobile_banking_app/models/payment_activity.dart';
import 'package:mobile_banking_app/models/users.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

class RecentActivityList extends StatefulWidget{
  late String itemToShow;
  List<Users> userList = [];
  RecentActivityList({super.key, required this.userList, required this.itemToShow});

  @override
  State<StatefulWidget> createState() => RecentActivityListUI();

}

class RecentActivityListUI extends State<RecentActivityList>{
  List<PaymentActivity> paymentActivities = [
    PaymentActivity(userID: 1, type: 'Send Money', amount: 75),
    PaymentActivity(userID: 2, type: 'Money Received', amount: 150),
    PaymentActivity(userID: 3, type: 'Mobile Recharged', amount: 5),
    PaymentActivity(userID: 3, type: 'Money Received', amount: 82),
    PaymentActivity(userID: 1, type: 'Money Received', amount: 10),
    PaymentActivity(userID: 2, type: 'Send Money', amount: 100),
    PaymentActivity(userID: 2, type: 'Send Money', amount: 124),
    PaymentActivity(userID: 2, type: 'Send Money', amount: 66),
    PaymentActivity(userID: 1, type: 'Mobile Recharged', amount: 10),
    PaymentActivity(userID: 3, type: 'Money Received', amount: 245),
    PaymentActivity(userID: 3, type: 'Mobile Recharged', amount: 12),
    PaymentActivity(userID: 2, type: 'Money Received', amount: 100),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: widget.itemToShow == '3' ? 3 : paymentActivities.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            leading: UserProfilePic(profilePic: widget.userList[paymentActivities[index].userID].profilePic),
            title: Text(widget.userList[paymentActivities[index].userID].name, style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text(paymentActivities[index].type, style: Theme.of(context).textTheme.bodySmall),
            trailing: Text('\$${paymentActivities[index].amount}', style: Theme.of(context).textTheme.bodyLarge),
          ),
        );
      },
    );
  }

}