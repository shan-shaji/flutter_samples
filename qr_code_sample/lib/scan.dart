import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  String barcode = "hello";
  @override       
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RaisedButton(onPressed: () {
                scan();
              }, color: Colors.blue, textColor: Colors.white,splashColor: Colors.blueGrey,child: Text("start camera scan"),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:  16.0, vertical: 8.0),
              child: Text(this.barcode),
            )
          ],
        ),
      ),
    );
  }

  Future scan() async{
    try{
      var barcode  = await BarcodeScanner.scan();

      setState(() {
        this.barcode = barcode.toString();
      });
    }on PlatformException catch(e){
      if(e.code == BarcodeScanner.CameraAccessDenied){
        setState(() {
          this.barcode = 'The user did not grant the camera permission';
        });
      }else{
        setState(() {
          this.barcode = 'Unknown Error';
        });
      }
    }on FormatException{
      setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    }catch(e){
      setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}

