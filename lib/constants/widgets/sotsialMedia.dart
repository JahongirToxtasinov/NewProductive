
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_productive/constants/colors.dart';
import 'package:new_productive/constants/widgets/w_button.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final Function() onTap;
  final String icon;
  const SocialMediaLoginButton({
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WButton(
      buttonColor: socialMediaButtonColor,
      width: 62,
      height: 48,
      onTap: onTap,
      child: SvgPicture.asset(icon),
    );
  }
}