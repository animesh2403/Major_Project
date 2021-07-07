import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final razorpay=Razorpay();

  TextEditingController controller=TextEditingController();

@override
  void initState() {
  razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWallet);
  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, paySuccess);
  razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, payError);
    super.initState();
  }
void paySuccess(PaymentSuccessResponse response){
  print('Paid Successfully');
  print(response.paymentId.toString());
}
  void payError(PaymentFailureResponse response){
  print('Payment Failed');
    print(response.message + response.code.toString());
  }
  void externalWallet(ExternalWalletResponse response){
  print('ExternalWallet');
  print(response.walletName);
  }
  getPayment() {
    var options = {
      'key': 'rzp_test_vRib0nK91CEBzd',
      'amount': 300000,
      'name': 'FPS Industries',
      'description': 'FPS Originals',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com'
      }
    };

    try{
    razorpay.open(options);
    }catch(e){
      print('error is $e');
    }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,

        children:<Widget> [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            child: Text('pay'),
            onPressed: ()=>getPayment(),
          ),
          
        ],
      ),
    );
  }
}


