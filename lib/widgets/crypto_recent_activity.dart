import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CryptoRecentActivityList extends StatefulWidget{
  const CryptoRecentActivityList({super.key});

  @override
  State<StatefulWidget> createState() => CryptoRecentActivityListUI();

}

class CryptoRecentActivityListUI extends State<CryptoRecentActivityList>{
  List<CryptoActivity> cryptoActivityList = [
    CryptoActivity(icon: 'assets/currency/ethereum.png', mode: "Sell", date: '21 November, 2023', amount: 0.0000064),
    CryptoActivity(icon: 'assets/currency/bitcoin.png', mode: "Buy", date: '21 November, 2023', amount: 0.0000082),
    CryptoActivity(icon: 'assets/currency/bitcoin.png', mode: "Buy", date: '21 November, 2023', amount: 0.0000011),
    CryptoActivity(icon: 'assets/currency/ethereum.png', mode: "Sell", date: '21 November, 2023', amount: 0.0000023),
    CryptoActivity(icon: 'assets/currency/ethereum.png', mode: "Sell", date: '21 November, 2023', amount: 0.0000014),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cryptoActivityList.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            leading: Image.asset(cryptoActivityList[index].icon, width: 40),
            title: Text(cryptoActivityList[index].amount.toString(), style: Theme.of(context).textTheme.bodyLarge),
            subtitle: Text(cryptoActivityList[index].date, style: Theme.of(context).textTheme.bodySmall),
            trailing: cryptoActivityList[index].mode == 'Buy' ? Icon(Icons.arrow_upward_sharp, size: 18.sp, color: Colors.green) : Icon(Icons.arrow_downward_sharp, size: 18.sp, color: Colors.red),
          ),
        );
      },
    );
  }

}

class CryptoActivity {
  late String icon;
  late String mode;
  late String date;
  late double amount;

  CryptoActivity({required this.icon, required this.mode, required this.date, required this.amount});
}