import 'package:flutter/material.dart';

class Button3D extends StatefulWidget {
  const Button3D({
    super.key,
    this.foregroundColor = const [Color(0xffFFA51D), Color(0xffFFBF5D)],
    this.backgroundColor = const Color(0xffFFA51D),
    this.focusedColor = const Color(0xffFFBF5D),
    required this.padding,
    required this.onTap,
    required this.child,
    this.borderRadius,
  });
  final BorderRadiusGeometry? borderRadius;
  final List<Color> foregroundColor;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color focusedColor;
  final Function() onTap;
  final Widget child;

  @override
  State<Button3D> createState() => _Button3DState();
}

class _Button3DState extends State<Button3D> {
  final ValueNotifier<bool> isClicking = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) => isClicking.value = true,
      onTapUp: (details) => isClicking.value = false,
      onTapCancel: () => isClicking.value = false,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: widget.borderRadius,
            ),
            child: widget.child,
          ),
          ValueListenableBuilder(
            valueListenable: isClicking,
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                top: value ? 0 : -4,
                child: Container(
                  padding: widget.padding,
                  decoration: BoxDecoration(
                    borderRadius: widget.borderRadius,
                    color: widget.focusedColor,
                    gradient: value
                        ? null
                        : LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: widget.foregroundColor),
                  ),
                  child: widget.child,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
