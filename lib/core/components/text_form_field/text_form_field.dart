import 'package:flutter/material.dart';
import 'package:superbase_flutter/core/constants/color_constant.dart';
import 'package:superbase_flutter/core/extensions/num_extensions.dart';
import 'package:superbase_flutter/core/utils/typedefs.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.validator,
      this.title,
      this.isPassword = false,
      this.onSaved,
      this.keyboardType = TextInputType.text,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.textInputAction = TextInputAction.next});

  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onSaved;
  final ValidatorFunction validator;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final TextInputAction? textInputAction;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    int length = widget.controller?.text.length ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.ph,
        Text(
          widget.title ?? '',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        8.ph,
        TextFormField(
          enableSuggestions: false,
          autocorrect: false,
          autofocus: true,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          onSaved: widget.onSaved,
          cursorColor: ColorConstants.instance.onPrimary,
          obscureText: widget.isPassword ?? false,
          autovalidateMode: widget.autovalidateMode,
          textInputAction: widget.textInputAction,
          onChanged: (value) => setState(() {
            length = value.length;
          }),
          // style: GoogleFonts.montserrat(),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(14.0),
            suffixIcon: InkWell(
              child: Text(
                '$length/10',
                textAlign: TextAlign.center,
                // style:
                // context.textTheme.text_xsR.copyWith(
                //   color: const Color(0xffC4C6CD),
                //   height: 4,
                // ),
              ),
            ),
            hintText: widget.hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            // errorStyle: GoogleFonts.montserrat(),
            // border: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(6),
            //     borderSide:
            //         BorderSide(color: ColorConstants.instance.onPrimary)),
            // focusedBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(6),
            //     borderSide: BorderSide(color: ColorConstants.instance.black0B)),
            // enabledBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(6),
            //     borderSide: BorderSide(color: ColorConstants.instance.border)),
            // errorBorder: OutlineInputBorder(
            //     borderRadius: BorderRadius.circular(6),
            //     borderSide: BorderSide(color: ColorConstants.instance.border)),
          ),
        ),
      ],
    );
  }
}
