import 'package:flutter/material.dart';

class _IconUX {
  static const size = 24.0;
  static const padding = 4.0;
}

class AnimatedIconButton extends _AnimatedButton {
  final Image icon;
  final bool tinted;

  AnimatedIconButton(this.icon,
      {required this.tinted, super.key, required super.onPressed})
      : super(scale: Tween(begin: 1.0, end: 1.2));

  @override
  Widget child() {
    return Padding(
      padding:
          const EdgeInsets.all(_IconUX.padding), // Apply padding from _IconUX
      child: SizedBox(
        width: _IconUX.size, // Apply size from _IconUX
        height: _IconUX.size,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            tinted ? Colors.white : Colors.transparent, // Apply the tint color
            BlendMode.srcATop, // Blend mode to apply the color to the icon
          ),
          child: icon, // Render the icon
        ),
      ),
    );
  }
}

class AnimatedTextButton extends _AnimatedButton {
  final String text;

  AnimatedTextButton(this.text, {super.key, required super.onPressed})
      : super(scale: Tween(begin: 1.0, end: 1.25));

  @override
  Widget child() {
    return Text(
      text,
      style: TextStyle(fontSize: 30),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final Tween<double>? rotation;
  final Tween<double>? scale;
  final Function onPressed;
  const _AnimatedButton(
      {super.key, this.rotation, this.scale, required this.onPressed});

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
                  widget.onPressed();
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
