import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:new_productive/constants/colors.dart';
import 'package:new_productive/constants/icons.dart';
import 'package:new_productive/constants/widgets/sotsialMedia.dart';
import 'package:new_productive/constants/widgets/w_button.dart';
import 'package:new_productive/constants/widgets/w_divider.dart';
import 'package:new_productive/constants/widgets/w_scale.dart';

class LoginScreen extends StatefulWidget {
  // static Route route() => MaterialPageRoute(
  //       builder: (_) => const LoginScreen(),
  //     );

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoginDataValid = false;
  final mailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  final mailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final textFieldContentStyle = const TextStyle(
    color: hintTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  final formKey = GlobalKey<FormState>();

  bool isObscure = true;

  InputDecoration decoration({
    required String hintText,
    Widget? suffixIcon,
  }) =>
      InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 13.5),
        hintStyle: TextStyle(
          color: hintTextColor.withOpacity(.6),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        fillColor: textFieldBackgroundColor2,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: textFieldBorderColor.withOpacity(.1),
            style: BorderStyle.solid,
          ),
        ),
      );

  @override
  void initState() {
    mailTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });

    passwordTextEditingController.addListener(() {
      if (formKey.currentState!.validate()) {
        if (!isLoginDataValid) {
          setState(() {
            isLoginDataValid = true;
          });
        }
      } else {
        if (isLoginDataValid) {
          setState(() {
            isLoginDataValid = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    mailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    mailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(67),
                SvgPicture.asset(GlobalIcons.logo),
                const Gap(44),
                TextFormField(
                  style: textFieldContentStyle,
                  cursorColor: cursorColor,
                  focusNode: mailFocusNode,
                  controller: mailTextEditingController,
                  decoration: decoration(hintText: 'Email'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onEditingComplete: () {
                    passwordFocusNode.requestFocus();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Iltimos, mail kiriting!';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Iltimos, yaroqli mail manzilini kiriting';
                    }

                    return null;
                  },
                ),
                const Gap(16),
                TextFormField(
                  style: textFieldContentStyle,
                  cursorColor: cursorColor,
                  focusNode: passwordFocusNode,
                  controller: passwordTextEditingController,
                  decoration: decoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 13.5),
                        child: SvgPicture.asset(
                          isObscure ? GlobalIcons.eyeOff : GlobalIcons.eyeOn,
                        ),
                      ),
                    ),
                  ),
                  onEditingComplete: () {
                   
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Iltimos, parolingizni kiriting!';
                    } else if (value.length < 7) {
                      return 'Parol eng kamida 8ta belgidan tashkil topgan bo\'lishi kerak';
                    }

                    return null;
                  },
                ),
                const Gap(12),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/forgotPassword");
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textButtonColor,
                      ),
                    ),
                  ),
                ),
                const Gap(16),
                WSale(
                  isDisable: !isLoginDataValid,
                  onTap: () {},
                  child: WButton(
                    isDisabled: !isLoginDataValid,
                    onTap: () {
                      Navigator.of(context).pushNamed("/home");
                    },
                    text: 'Login',
                  ),
                ),
                const Gap(56),
                const Row(
                  children: [
                    Expanded(child: WDivider()),
                    Gap(6),
                    Text(
                      'OR',
                      style: TextStyle(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Gap(5),
                    Expanded(child: WDivider()),
                  ],
                ),
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaLoginButton(
                        onTap: () {}, icon: GlobalIcons.facebook),
                    const Gap(32),
                    SocialMediaLoginButton(onTap: () {}, icon: GlobalIcons.google),
                    const Gap(32),
                    SocialMediaLoginButton(onTap: () {}, icon: GlobalIcons.apple),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 18, right: 4),
            child: const Text(
              "Don’t have an account ?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: white,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed("/SignUp");
            },
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 18),
              child: const Text(
                "Sign up",
                style: TextStyle(fontSize: 15, color: singUpTextColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
