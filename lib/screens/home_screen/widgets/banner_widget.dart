
import '../../../models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.height,
    required this.banner
  });

  final double height;
  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height/5,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: NetworkImage(banner.imageUrl,),
              fit: BoxFit.fill)
      ),
    );
  }
}
