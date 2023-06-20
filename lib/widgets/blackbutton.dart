import 'package:flutter/material.dart';

//TODO: Add a > {specified in design file} to the button in this page
class BlackButton extends StatelessWidget {
  const BlackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(60)),
                    side:
                        BorderSide(color: Theme.of(context).backgroundColor)))),
        onPressed: () {
          Navigator.pushNamed(context, '/error');
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 18),
          child: Text(
            'Book a service!',
            style: TextStyle(
                color: Color(0xFFCCFE00), fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
