// import 'package:flutter/material.dart';

// class TutorialOverlay extends ModalRoute<void> {
//   static String path = '/TutorialOverlay';
//   static String routeName = 'TutorialOverlay';
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 500);

//   @override
//   bool get opaque => false;

//   @override
//   bool get barrierDismissible => false;

//   @override
//   Color get barrierColor => Colors.black.withOpacity(0.5);

//   @override
//   String? get barrierLabel => null;

//   @override
//   bool get maintainState => true;

//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     // This makes sure that text and other content follows the material style
//     return Material(
//       type: MaterialType.transparency,
//       // make sure that the overlay content is not cut off
//       child: SafeArea(
//         child: _buildOverlayContent(context),
//       ),
//     );
//   }

//   Widget _buildOverlayContent(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           const Text(
//             'This is a nice overlay',
//             style: TextStyle(color: Colors.white, fontSize: 30.0),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.pop(context),
//             child: const Text('Dismiss'),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget buildTransitions(BuildContext context, Animation<double> animation,
//       Animation<double> secondaryAnimation, Widget child) {
//     // You can add your own animations for the overlay content
//     return FadeTransition(
//       opacity: animation,
//       child: ScaleTransition(
//         scale: animation,
//         child: child,
//       ),
//     );
//   }
// }

// // // Example application:
// // void main() => runApp(MyApp());

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Playground',
// //       home: TestPage(),
// //     );
// //   }
// // }

// // class TestPage extends StatelessWidget {

// //   void _showOverlay(BuildContext context) {
// //     Navigator.of(context).push(TutorialOverlay());
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Test')),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Center(
// //           child: TutorialOverlay
// //         ),
// //       ),
// //     );
// //   }
// // }
