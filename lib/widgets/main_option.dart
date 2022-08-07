import 'package:flutter/material.dart';

class MainOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? subtitle;
  final bool? enabled;
  final void Function() onPressed;

  const MainOption(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.iconColor,
      required this.title,
      this.subtitle,
      this.enabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => {
        if (enabled ?? true) onPressed()
      },
      child: Center(
        child: Opacity(
          opacity: (enabled ?? true) ? 1.0 : 0.3,
          child: SizedBox(
            width: 300,
            height: 100,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  icon,
                  size: 64,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 16
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      if (subtitle != null) Text(subtitle!,
                        style: const TextStyle(
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
