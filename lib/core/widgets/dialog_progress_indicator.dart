import 'package:flutter/material.dart';
import 'package:my_gallery/core/widgets/my_progress.dart';

class DialogIndicator extends StatelessWidget {
  const DialogIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: MyProgress(),
      ),
    );
  }
}