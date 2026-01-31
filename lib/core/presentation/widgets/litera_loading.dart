import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_litera/core/constants/app_colors.dart';

class LiteraLoading extends StatefulWidget {
  final bool isOverlay;

  const LiteraLoading({super.key, this.isOverlay = true});

  @override
  State<LiteraLoading> createState() => _LiteraLoadingState();
}

class _LiteraLoadingState extends State<LiteraLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String _randomText;

  bool _isVisible = false;

  final List<String> _loadingMessages = [
    "Brewing your stories...",
    "Curating your library...",
    "Syncing magic...",
    "Just a second...",
    "Bringing stories to life...",
    "Dusting the bookshelves...",
    "Turning the page...",
    "Finding your next read...",
    "Organizing tales...",
  ];

  @override
  void initState() {
    super.initState();
    _randomText = _loadingMessages[Random().nextInt(_loadingMessages.length)];

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isOverlay
        ? Colors.black.withValues(alpha: 0.7)
        : Colors.transparent;

    final textColor = widget.isOverlay ? Colors.white : Colors.grey[600];
    final iconBgColor = widget.isOverlay
        ? Colors.white.withValues(alpha: 0.1)
        : Colors.grey[200];
    final iconColor = widget.isOverlay ? Colors.white : AppColors.primary;

    return Material(
      color: bgColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _controller,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.elasticOut,
                  padding: EdgeInsets.all(_isVisible ? 24 : 10),
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: iconColor.withValues(alpha: 0.2),
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.menu_book_rounded,
                    color: iconColor,
                    size: widget.isOverlay ? 50 : 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 1000),
              child: Text(
                _randomText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontSize: widget.isOverlay ? 14 : 12,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 2.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
