import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:superbase_flutter/core/base/functions/base_functions.dart';
import 'package:superbase_flutter/core/extensions/num_extensions.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget implements PreferredSizeWidget {
  final IconData? iconLeft;
  final String? title;
  final IconData? iconRight;
  final bool hideIconLeft;
  final bool? centerTitle;
  final Color bg;
  final Color colorIconLeft;
  Function()? onTap;

  Header(
      {super.key,
      this.iconLeft = Icons.arrow_back_ios,
      this.title,
      this.iconRight,
      this.onTap,
      this.hideIconLeft = false,
      this.centerTitle,
      this.bg = Colors.white,
      this.colorIconLeft = Colors.black});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bg,
      surfaceTintColor: Colors.white,
      leading: hideIconLeft
          ? Container()
          : IconButton(
              onPressed: onTap ?? () => context.pop(),
              icon: iconLeft != null
                  ? Icon(
                      iconLeft,
                      size: 18,
                      color: colorIconLeft,
                    )
                  : BaseFunctions.instance.platformBackButton(onPressed: () {}),
            ),
      title: Text(
        title ?? '',
        // style: context.textTheme.text_mdM,
      ),
      centerTitle: centerTitle ?? true,
      actions: [
        iconRight != null
            ? Icon(
                iconRight,
                size: 20,
                color: Colors.black,
              )
            : 0.ph
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
