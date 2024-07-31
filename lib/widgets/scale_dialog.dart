import 'package:flutter/material.dart';

void scaleDialog(BuildContext context, Widget dialogContent) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: 'Dialog',
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return Container();
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(8.0),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          content: dialogContent,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}
