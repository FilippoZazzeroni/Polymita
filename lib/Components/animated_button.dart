import 'package:flutter/material.dart';

class AnimatedIconButton extends _AnimatedButton {
  final IconData icon;

  AnimatedIconButton(this.icon, {super.key})
      : super(scale: Tween(begin: 1.0, end: 1.2));

  @override
  Widget child() {
    return Icon(icon);
  }
}

class AnimatedTextButton extends _AnimatedButton {
  final String text;

  AnimatedTextButton(this.text, {super.key})
      : super(scale: Tween(begin: 1.0, end: 1.25));

  @override
  Widget child() {
    return Text(text);
  }
}

class _AnimatedButton extends StatefulWidget {
  final Tween<double>? rotation;
  final Tween<double>? scale;
  const _AnimatedButton({super.key, this.rotation, this.scale});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();

  Widget child() {
    throw UnimplementedError();
  }
}

class _AnimatedButtonState extends State<_AnimatedButton>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late final Animation<double>? _rotation;
  late final Animation<double>? _scale;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200),
        reverseDuration: const Duration(milliseconds: 50),
        vsync: this);
    _rotation = widget.rotation?.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
    _scale = widget.scale?.animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeOutCubic));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        _animationController.forward();
      },
      onExit: (event) {
        _animationController.reverse();
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..rotateZ(_rotation?.value ?? 0)
                ..scale(_scale?.value ?? 1.0),
              child: ElevatedButton(
                onPressed: () {
                  // Button action goes here
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                child: widget.child(),
              ),
            );
          }),
    );
  }
}
