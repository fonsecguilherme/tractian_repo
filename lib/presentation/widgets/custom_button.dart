import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isTapped;

  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.isTapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isTapped ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            color: isTapped ? Colors.blue : const Color(0xffD8DFE6),
          ),
        ),
        child: Row(
          children: <Widget>[
            title == 'Sensor de Energia'
                ? SvgPicture.asset(
                    'assets/icons/bolt.svg',
                    width: 8.85,
                    height: 13.42,
                  )
                : const Icon(
                    Icons.info_outline,
                    size: 13.0,
                  ),
            const SizedBox(width: 9.56),
            Text(
              title,
              style: TextStyle(
                color: isTapped ? Colors.white : const Color(0xff77818C),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
