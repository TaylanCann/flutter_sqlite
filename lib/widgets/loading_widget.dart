import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0.9440176486968994, 0.04915884137153627),
                end: Alignment(0.09232494235038757, 1),
                colors: [
              const Color(0xff9617ad),
              const Color(0xff5f35bf),
              const Color(0xff2d8fd9)
            ])),
      ),
    );
  }
}
