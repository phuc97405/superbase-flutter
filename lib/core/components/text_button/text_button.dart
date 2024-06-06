import 'package:flutter/material.dart';

class TextButtonBase extends StatelessWidget {
  const TextButtonBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: TextButton.icon(
          onPressed: () => {},
          style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
              backgroundColor: Colors.black,
              // minimumSize: const Size(200, 80)
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              shadowColor: Colors.blue.withOpacity(0.5),
              side: const BorderSide(width: 2, color: Colors.red),
              disabledForegroundColor: Colors.black45,
              disabledBackgroundColor: Colors.white),
          icon: const Icon(
            Icons.safety_check,
            size: 20,
          ),
          label: const Text(
            'Submit',
            style: TextStyle(fontSize: 16),
          ),
        ));
  }
}
