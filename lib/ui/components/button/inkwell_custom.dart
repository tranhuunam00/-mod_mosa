import 'package:flutter/material.dart';

class InkwellStyle extends StatelessWidget {
  final String label;
  final Color? color;
  final IconData? icon;
  final double? width;
  final VoidCallback? onTap;
  const InkwellStyle({
    Key? key,
    required this.label,
    required this.onTap,
    this.color,
    this.width = 150,
    this.icon = null,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(minWidth: 120),
      child: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: color ?? Color.fromARGB(255, 143, 211, 250),
                  elevation: 4,
                  child: InkWell(
                    focusColor: (Color.fromARGB(255, 90, 233, 252)),
                    onTap: onTap,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    overlayColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 123, 250, 229)),
                    child: Container(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 12, right: 8, left: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            icon != null
                                ? Container(
                                    constraints: BoxConstraints(maxWidth: 100),
                                    child: Icon(icon ?? null),
                                  )
                                : Container(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 30),
                              child: Text(
                                label,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
