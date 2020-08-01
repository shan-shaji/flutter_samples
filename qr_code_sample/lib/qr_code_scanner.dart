import 'package:flutter/material.dart';
import 'package:qr_code_sample/scan.dart';

class QrCodeReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qr code scanner"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                splashColor: Colors.blueGrey,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanScreen(),),);
                },
                child: Text("Scan Qr Code"),
              ),
            )
          ],
        )
      ),
    );
  }
}