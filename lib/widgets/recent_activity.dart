import 'package:flutter/material.dart';

//models
import 'package:mobile_banking_app/models/payment_activity.dart';
import 'package:mobile_banking_app/models/users.dart';

//widgets
import 'package:mobile_banking_app/widgets/user_profile_pic.dart';

class RecentActivityList extends StatefulWidget{
  List<Users> userList = [];
  RecentActivityList({super.key, required this.userList});

  @override
  State<StatefulWidget> createState() => RecentActivityListUI();

}

class RecentActivityListUI extends State<RecentActivityList>{
  List<PaymentActivity> paymentActivities = [
    PaymentActivity(userID: 1, type: 'Send Money', amount: 75),
    PaymentActivity(userID: 2, type: 'Money Received', amount: 150),
    PaymentActivity(userID: 3, type: 'Mobile Recharged', amount: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: paymentActivities.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            leading: UserProfilePic(profilePic: widget.userList[paymentActivities[index].userID].profilePic),
            title: Text(widget.userList[paymentActivities[index].userID].name, style: Theme.of(context).textTheme.bodyMedium),
            subtitle: Text(paymentActivities[index].type, style: Theme.of(context).textTheme.bodySmall),
            trailing: Text('\$${paymentActivities[index].amount}', style: Theme.of(context).textTheme.bodyLarge),
          ),
        );
      },
    );
  }

}