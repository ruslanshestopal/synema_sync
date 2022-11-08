import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
      ),
      width: 180,
      height: 80,
      padding: EdgeInsets.all(10),
      child: Image.asset('assets/gif/Loading.gif'),
    );
  }
}

showLoading() {
  BotToast.showCustomLoading(toastBuilder: (close) {
    return LoadingWidget();
  });
}

stopLoading() {
  BotToast.closeAllLoading();
}



