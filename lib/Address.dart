import 'package:flutter/material.dart';
import 'package:flutterFcm/home.dart';
class AddAddress extends StatefulWidget {
  const AddAddress({key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Address',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
        backgroundColor: Colors.green,
        leading: IconButton(
        onPressed: () {
        Navigator.pop(context);},
    icon: Icon(
    Icons.arrow_back_rounded,
    size: 20,
    color: Colors.black,),
    ),),
      body: Column(
        children: <Widget>[
          SizedBox(height:30,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Full Name',
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(height:10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'House No. / Building Name',
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(height:10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Locality',
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(height:10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'City',
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(height:10,),
          TextField(
            decoration: InputDecoration(
                hintText: 'Pincode',
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                ),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400]))),
          ),
          SizedBox(height: 280,),
          MaterialButton(
            minWidth: double.infinity,
            height: 60,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomePage()));
            },
            color: Color(0xff0095FF),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Add Address",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
