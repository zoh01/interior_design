import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

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
  static const likedKey = 'liked_key';

  late bool liked = false;

  @override
  void initState() {
    super.initState();
    _restorePersistedPreference();
  }

  void _restorePersistedPreference() async {
    var preferences = await SharedPreferences.getInstance();
    var liked = preferences.getBool(likedKey);
    setState(() {
      this.liked = liked!;
    });
  }
  void _persistPreference() async {
    setState(() {
      liked = !liked;
    });
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool(likedKey, liked);
  }
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _persistPreference,
      icon: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.red : Colors.white,
      ),
    );
  }
}
