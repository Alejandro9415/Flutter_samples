import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  Progress({Key  key, this.descarga = false, this.value, this.onPressed})
      : super(key: key);
  VoidCallback onPressed;

  bool descarga;
  double value;

  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: kToolbarHeight,
        height: kToolbarHeight,
        child: Stack(
          fit: StackFit.expand,
          children: [
            widget.descarga?
                 CircularProgressIndicator(
                    value: widget.value,
                  )
                : Container(),
            widget.descarga ? Icon(Icons.close) : Icon(Icons.download_rounded)
          ],
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 30,
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2),
                ],
                stops: [
                  0.0,
                  1.0
                ])),
      ),
    );
  }
}
