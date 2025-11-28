import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ZCircularIcon extends StatefulWidget {
  const ZCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ZSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  State<ZCircularIcon> createState() => _ZCircularIconState();
}

class _ZCircularIconState extends State<ZCircularIcon> {
  static const _likedKey = 'liked_key';
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
  }

  Future<void> _restorePersistedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    final liked = prefs.getBool(_likedKey) ?? false; // default to false
    if (!mounted) return;
    setState(() {
      _liked = liked;
    });
  }

  Future<void> _persistPreference() async {
    if (!mounted) return;
    setState(() {
      _liked = !_liked;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_likedKey, _liked);

    // Call optional callback
    widget.onPressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? widget.size,
      height: widget.height ?? widget.size,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: _persistPreference,
        icon: Icon(
          _liked ? Icons.favorite : Icons.favorite_border,
          color: _liked ? (widget.color ?? Colors.red) : Colors.white,
          size: widget.size,
        ),
      ),
    );
  }
}