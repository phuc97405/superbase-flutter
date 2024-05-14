import 'package:flutter/material.dart';

class ButtonSocial extends StatelessWidget {
  final String label;
  final String? icon;
  final Color bg;
  final Color? textColor;
  final bool disabled;
  final Function()? onTap;
  final bool mgB;
  const ButtonSocial({
    super.key,
    required this.label,
    this.icon,
    required this.bg,
    this.textColor,
    required this.onTap,
    this.disabled = false,
    this.mgB = false,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: mgB ? 14 : 24),
          margin: EdgeInsets.only(bottom: mgB ? 12 : 0),
          decoration: BoxDecoration(
              color: disabled ? const Color(0xffC4C6CD) : bg,
              borderRadius: const BorderRadius.all(Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Container()
                  // Image.asset(
                  // icon!.toPng,
                  // fit: BoxFit.contain,
                  // )
                  : Container(),
              SizedBox(
                width: 6,
              ),
              Text(
                label,
                // style: context.textTheme.text_smB.copyWith(color: textColor)
              )
            ],
          ),
        ),
      ),
    );
  }
}
