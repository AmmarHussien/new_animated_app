import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_animated_app/screens/home/entry_point.dart';
import 'package:new_animated_app/utils/rive_utils.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConfetti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;

  late SMITrigger confetti;

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConfetti = true;
    });
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(
                () {
                  isShowLoading = false;
                },
              );

              confetti.fire();
              Future.delayed(
                const Duration(seconds: 1),
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EntryPoint(),
                    ),
                  );
                },
              );
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(
                () {
                  isShowLoading = false;
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onSaved: (email) {},
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onSaved: (password) {},
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
                  onPressed: () {
                    signIn(context);
                  },
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPostioned(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard);
                    check = controller.findSMI('Check') as SMITrigger;
                    error = controller.findSMI('Error') as SMITrigger;
                    reset = controller.findSMI('Reset') as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPostioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    'assets/RiveAssets/confetti.riv',
                    onInit: (artboard) {
                      StateMachineController controller =
                          RiveUtils.getRiveController(artboard);
                      confetti =
                          controller.findSMI('Trigger explosion') as SMITrigger;
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class CustomPostioned extends StatelessWidget {
  const CustomPostioned({
    super.key,
    required this.child,
    this.size = 100,
  });
  final Widget child;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: size,
            width: size,
            child: child,
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
