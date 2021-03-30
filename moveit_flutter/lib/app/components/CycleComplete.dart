import 'package:flutter/material.dart';

import '../../constants.dart';

class CycleComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ciclo encerrado',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.check_circle_rounded, color: kGreen),
          ],
        ),
      ),
    );
  }
}
