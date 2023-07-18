import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Email',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset('assets/icons/email.svg'),
                ),
              ),
            ),
          ),
          const Text(
            'Password',
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 16,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset('assets/icons/password.svg'),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 24,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.arrow_right,
                color: Color(0xFFFE0037),
              ),
              label: const Text('Sign In'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFFF77D8E,
                  ),
                  minimumSize: const Size(
                    double.infinity,
                    56,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        10,
                      ),
                      topRight: Radius.circular(
                        25,
                      ),
                      bottomRight: Radius.circular(
                        25,
                      ),
                      bottomLeft: Radius.circular(
                        25,
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
