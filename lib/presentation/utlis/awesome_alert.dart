import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Alert {
  static showAlert(BuildContext context, String title, String content,
      String action, DialogType? type) {
    AwesomeDialog(
      context: context,
      title: title,
      body: Center(
          child: Text(content,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18.0,
              ))),
      dialogType: type ?? DialogType.info,
      btnOkText: action,
      animType: AnimType.rightSlide,
      btnOkColor: Theme.of(context).colorScheme.secondary,
      alignment: Alignment.center,
      btnOkOnPress: () {},
    ).show();
  }
}
