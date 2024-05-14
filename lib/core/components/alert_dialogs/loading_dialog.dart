import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text("Loading..."),
        ],
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const LoadingDialog();
    },
  );
}

void hideLoadingDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).maybePop();
}

void hideLoadingDialogAsync(BuildContext context) {
  if (Navigator.of(context).canPop()) {
    return Navigator.of(context).pop<bool>(true);
  }
}

// Future<bool> hideLoadingDialogAsync(BuildContext context) async{
//   // final result = await Navigator.of(context).pop(true);
//   if (Navigator.of(context).canPop()) {
//    return Navigator.of(context).pop<bool>(true);
//   }
// }
