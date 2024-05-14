import 'package:flutter/material.dart';
import 'package:superbase_flutter/core/constants/color_constant.dart';

class ReportAlertDialog extends StatelessWidget {
  const ReportAlertDialog({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 36.0),
      backgroundColor: ColorConstants.instance.aliceBlue,
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  '신고가 성공적으로 접수되었습니다.',
                  // style:
                  //  context.textTheme.text_lgM.copyWith(height: 1),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: ColorConstants.instance.primaryDefault,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      // print('OK');
                      Navigator.pop(context, true);
                    },
                    child: Text(
                      '확인',
                      // style: context.textTheme.text_smB
                      //     .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: null,
    );
  }
}
