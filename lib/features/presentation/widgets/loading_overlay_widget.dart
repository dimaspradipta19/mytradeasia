import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Grey background
        Opacity(
          opacity: 0.5,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.grey[300],
          ),
        ),

        // Loading indicator
        const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
