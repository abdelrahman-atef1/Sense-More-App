import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class DefaultNetworkImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const DefaultNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: imageUrl,
      fit: fit??BoxFit.cover,
      errorWidget: (context, url, error) => SizedBox(
                    width: width??60.r,
                    height: width??60.r,
                    child: Shimmer.fromColors(
                      baseColor: ColorManager.defaultGrey,
                      highlightColor: ColorManager.white,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSize.s4)
                        ),
                      )
                    ),
                  ),
    );
  }
}
