import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:to_do_hivepackage_app/main.dart';
import 'package:to_do_hivepackage_app/utils/strings.dart';

class Constants {
  static String lottieUrl = 'assets/lottie/lottie.json';
}

dynamic emptyWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppString.oopsMsg,
    subMsg: 'Please fill all the fields',
    duration: 2000,
    corner: 20,
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppString.oopsMsg,
    subMsg: 'You must edit alll the tasks',
    duration: 2000,
    corner: 20,
  );
}

dynamic noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    message: "There is no task to delete \n please add a task",
    title: AppString.oopsMsg,
    barrierDismissible: true,
    panaraDialogType: PanaraDialogType.error,
    buttonText: 'OK',
    onTapDismiss: () {
      Navigator.pop(context);
    },
  );
}

dynamic deleteAlltheTask(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    message:
        "Are u sure ? u want  to delete all this tasks \n you will not able to undo this action",
    title: AppString.areYouSure,
    barrierDismissible: false,
    panaraDialogType: PanaraDialogType.error,
    cancelButtonText: 'No',
    confirmButtonText: 'yes',
    onTapConfirm: () {
      Basewidget.of(context).hivedata.box.clear();
      Navigator.pop(context);
    },
    onTapCancel: () {
      Navigator.pop(context);
    },
  );
}
