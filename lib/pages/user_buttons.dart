import 'package:flutter/material.dart';

class UserButtons extends StatelessWidget {
  const UserButtons({Key key, this.onReload, this.onNext}) : super(key: key);

  final Function onReload;
  final Function onNext;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Ink(
          decoration: ShapeDecoration(
            color: Colors.grey,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 36,
            onPressed: onReload == null? null : () => onReload(),
            icon: const Icon(Icons.refresh),
          ),
        ),
        Ink(
          decoration: ShapeDecoration(
            color: Colors.lightBlue,
            shape: CircleBorder(),
          ),
          child: IconButton(
            iconSize: 36,
            color: Colors.black,
            onPressed: onReload == null ? null : () => onNext(),
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
