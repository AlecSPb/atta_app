import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SharedWidget {

  static onLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {},
            child: Center(child: SpinKitFadingCircle(
              itemBuilder: (_, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            )),
          );
        });
  }

  static loading(BuildContext context) {
    
          return Center(
            child: CircularProgressIndicator(
            
            ),
          );
          
          
          
          //  WillPopScope(
          //   onWillPop: () {},
          //   child: Center(child: SpinKitFadingCircle(
          //     itemBuilder: (_, int index) {
          //       return DecoratedBox(
          //         decoration: BoxDecoration(
          //           color: index.isEven ? Colors.red : Colors.green,
          //         ),
          //       );
          //     },
          //   )),
          // );
       
  }

  static void  showSnackBar(GlobalKey<ScaffoldState> key,message) {
    
     final snackBar= SnackBar(
       
        content: Text(message),
        duration: Duration(seconds: 2),
      );
      key.currentState.showSnackBar(snackBar);
  }
}
