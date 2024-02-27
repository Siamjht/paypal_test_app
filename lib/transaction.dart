

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal_test_app/Payment.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Paypal Payment',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      "Items in your Cart",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    ListTile(
                      title: Text(
                        "Product: iPhone 7",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Quantity: 1",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      trailing: Text(
                        "\$200",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // make PayPal payment

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Payment(
                          onFinish: (number) async {
                            // payment done
                            print('order id: ' + number);
                            print('ddasdas');
                          },
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Pay with Paypal',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
