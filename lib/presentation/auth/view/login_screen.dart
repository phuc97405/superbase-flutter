import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:superbase_flutter/core/constants/enums/auth_enums.dart';
import 'package:superbase_flutter/core/extensions/num_extensions.dart';
import 'package:superbase_flutter/generated/app_localizations.dart';
import 'package:superbase_flutter/generated/locales.g.dart';
import 'package:superbase_flutter/presentation/auth/cubit/auth_cubit.dart';
import 'package:superbase_flutter/presentation/auth/view/components/button_social.dart';
import 'package:superbase_flutter/presentation/auth/view/models/social_model.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login_screen';
  static String path = '/login_screen';
  // final Function? onLocaleChange;

  // const LoginScreen({super.key, this.onLocaleChange});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    super.initState();
  }

  final List<SocialModel> listLoginSocial = [
    SocialModel(
      title: '네이버로 시작하기(NaVer)',
      img: 'ic_naver',
      bg: Colors.green,
      // ColorConstants.instance.green,
      textColor: Colors.white,
    ),
    SocialModel(
        title: 'Apple로 시작하기',
        img: 'ic_apple',
        bg: Colors.black,
        //  ColorConstants.instance.black0B,
        textColor: Colors.white),
    SocialModel(
        title: '카카오로 시작하기(KaKao)',
        img: 'ic_kakao',
        bg: Colors.yellow,
        textColor: Colors.black),
    SocialModel(
        title: '구글로 시작하기(Gmail)',
        img: 'ic_gg',
        bg: Colors.grey,
        // ColorConstants.instance.bgGoogle,
        textColor: Colors.black)
  ];

  void handleSocial(BuildContext context, String type) {
    switch (type) {
      case 'ic_naver':
        // localization.translate('en');
        // context.read<AuthBloc>().add(LoginWithNaVer());
        break;
      case 'ic_apple':
        // context.read<AuthBloc>().add(LoginWithApple());
        break;
      case 'ic_kakao':
        context.read<AuthCubit>().loginWithKaKao();
        // context.read<AuthBloc>().add(LoginWithKaKao());
        break;
      case 'ic_gg':
        // context.read<AuthBloc>().add(LoginWithGmail());
        break;
      default:
    }
  }

  showDialogView({required BuildContext context, required Widget content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: content);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: Header(
        //   onTap: () => context.pop(),
        // ),
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              ...List.generate(
                  listLoginSocial.length,
                  (index) => !Platform.isIOS && index == 1
                      ? Container()
                      // 0.ph
                      : ButtonSocial(
                          onTap: () {
                            handleSocial(context, listLoginSocial[index].img);
                          },
                          mgB: true,
                          label: listLoginSocial[index].title,
                          icon: listLoginSocial[index].img,
                          bg: listLoginSocial[index].bg,
                          textColor: listLoginSocial[index].textColor,
                        ))
            ],
          ),
        ),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.status == AuthStatus.loading) {
              showDialogView(
                  context: context,
                  content: Row(
                    children: [
                      const CircularProgressIndicator(),
                      Container(
                          margin: const EdgeInsets.only(left: 7),
                          child: const Text("Loading...")),
                    ],
                  ));
            }

            if (state.messError != null &&
                state.messError?.isNotEmpty == true) {
              Navigator.pop(context);
              // if (state.messError != null) {
              showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 7),
                              child: Text(state.messError ?? '')),
                        ],
                      ),
                      actions: [
                        GestureDetector(
                          child: const Text("Ok"),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
              return;
            }
            // if (state.status == AuthStatus.authenticated) {
            //   Navigator.pop(context);
            //   context.go(HomeScreen.path);
            // }
            // if (state.status == AuthStatus.notRegistered) {
            //   Navigator.pop(context);
            //   context.pushNamed(VerificationScreen.routeName,
            //       pathParameters: {
            //         'accessToken': state.accessToken ?? '',
            //         'method': state.method ?? ''
            //       });
            // }
            // },
          },
          builder: (BuildContext context, AuthState state) => 0.ph,
        ),
        GestureDetector(
          onTap: () => {},
          child: Text(AppLocalizations.of(context)
                  ?.translate(LocaleKeys.buttons_sign_in) ??
              ''),
        )
      ]),
    ));
  }
}
