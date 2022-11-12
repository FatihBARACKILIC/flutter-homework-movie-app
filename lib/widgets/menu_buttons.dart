import 'package:flutter/material.dart';

/// Ana ekrandaki button'un tasarımının oluştuğu sayfa
class MenuButtons extends StatelessWidget {
  const MenuButtons({
    super.key,
    required this.cb,
    required this.icon,
    required this.text,
    this.textColor = Colors.white60,
  });

  final Function cb;
  final IconData icon;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          cb();
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(
            Color.fromRGBO(255, 255, 255, .2),
          ),
          foregroundColor: MaterialStatePropertyAll<Color>(
            textColor,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .33,
          height: MediaQuery.of(context).size.width * .33,
          child: Center(
              child: Table(
            children: [
              TableRow(
                children: <Widget>[
                  Center(
                    child: Icon(
                      icon,
                      size: MediaQuery.of(context).size.width * .18,
                    ),
                  ),
                ],
              ),
              TableRow(
                children: <Widget>[
                  Center(
                    child: Text(
                      text,
                      // style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
