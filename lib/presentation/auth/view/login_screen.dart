import 'dart:io';
import 'package:flutter/material.dart';
import 'package:superbase_flutter/presentation/auth/view/components/button_social.dart';
import 'package:superbase_flutter/presentation/auth/view/models/social_model.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'login_screen';
  static String path = '/login_screen';

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
        // context.read<AuthBloc>().add(LoginWithNaVer());
        break;
      case 'ic_apple':
        // context.read<AuthBloc>().add(LoginWithApple());
        break;
      case 'ic_kakao':
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
      child: Column(children: [
        Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image.asset(
                //   'logo'.toPng,
                //   width: 105.09,
                //   height: 100,
                //   fit: BoxFit.contain,
                // ),
                // RichText(
                //     text: TextSpan(
                //         text: '조건없는 광고',
                //         style: context.textTheme.text_xlB,
                //         children: const [
                //       TextSpan(
                //           text: '를 한눈에 확인하자!',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.w400))
                //     ]))
              ],
            )),
        Flexible(
            flex: 3,
            child: Padding(
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
                                handleSocial(
                                    context, listLoginSocial[index].img);
                              },
                              mgB: true,
                              label: listLoginSocial[index].title,
                              icon: listLoginSocial[index].img,
                              bg: listLoginSocial[index].bg,
                              textColor: listLoginSocial[index].textColor,
                            ))
                ],
              ),
            )),
        // BlocConsumer<AuthBloc, AuthState>(
        //   listener: (context, state) {
        //     if (state.status == AuthStatus.loading) {
        //       showDialogView(
        //           context: context,
        //           content: Row(
        //             children: [
        //               const CircularProgressIndicator(),
        //               Container(
        //                   margin: const EdgeInsets.only(left: 7),
        //                   child: const Text("Loading...")),
        //             ],
        //           ));
        //     }
        //     if (state.messError != null &&
        //         state.messError?.isNotEmpty == true) {
        //       Navigator.pop(context);
        //       // if (state.messError != null) {
        //       showDialog(
        //           barrierDismissible: false,
        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               content: Row(
        //                 children: [
        //                   Container(
        //                       margin: const EdgeInsets.only(left: 7),
        //                       child: Text(state.messError ?? '')),
        //                 ],
        //               ),
        //               actions: [
        //                 GestureDetector(
        //                   child: const Text("Ok"),
        //                   onTap: () {
        //                     Navigator.pop(context);
        //                   },
        //                 ),
        //               ],
        //             );
        //           });
        //       return;
        //     }
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
        // listenWhen: (previous, current) => true,
        // builder: (BuildContext context, AuthState state) => 0.ph,
        // )
      ]),
    ));
  }
}
