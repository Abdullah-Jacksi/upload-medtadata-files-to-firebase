import 'package:flutter/material.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child:  Center(
        child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator()),
      ),
    );
  }
}
