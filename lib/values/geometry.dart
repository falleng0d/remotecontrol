import 'package:flutter/rendering.dart';

class Geometry {
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

  final bool? expand;
  final int? flex;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  bool isEmpty({bool includeExpand = true, bool includeFlex = true}) {
    return width == null &&
        height == null &&
        minWidth == null &&
        maxWidth == null &&
        minHeight == null &&
        maxHeight == null &&
        (includeExpand ? expand == null : true) &&
        (includeFlex ? flex == null : true) &&
        (padding == null ||
            (padding!.bottom == 0 &&
                padding!.top == 0 &&
                padding!.left == 0 &&
                padding!.right == 0)) &&
        (margin == null ||
            (margin!.bottom == 0 &&
                margin!.top == 0 &&
                margin!.left == 0 &&
                margin!.right == 0));
  }

  const Geometry({
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.expand,
    this.flex,
    this.padding,
    this.margin,
  });

  Geometry copyWith(
      {double? width,
      double? height,
      double? minWidth,
      double? maxWidth,
      double? minHeight,
      double? maxHeight,
      bool? expand,
      int? flex,
      EdgeInsets? padding,
      EdgeInsets? margin}) {
    assert(!(expand == false && flex != null));
    return Geometry(
        width: width ?? this.width,
        height: height ?? this.height,
        minWidth: minWidth ?? this.minWidth,
        maxWidth: maxWidth ?? this.maxWidth,
        minHeight: minHeight ?? this.minHeight,
        maxHeight: maxHeight ?? this.maxHeight,
        expand: expand ?? this.expand,
        flex: flex ?? this.flex,
        padding: padding ?? this.padding,
        margin: margin ?? this.margin);
  }

  Geometry copyFrom(Geometry other) {
    return Geometry(
      width: other.width ?? width,
      height: other.height ?? height,
      minWidth: other.minWidth ?? minWidth,
      maxWidth: other.maxWidth ?? maxWidth,
      minHeight: other.minHeight ?? minHeight,
      maxHeight: other.maxHeight ?? maxHeight,
      expand: other.expand ?? expand,
      flex: other.flex ?? flex,
      padding: other.padding ?? padding,
      margin: other.margin ?? margin,
    );
  }

  Geometry copy() {
    return Geometry(
      width: width,
      height: height,
      minWidth: minWidth,
      maxWidth: maxWidth,
      minHeight: minHeight,
      maxHeight: maxHeight,
      expand: expand,
      flex: flex,
      padding: padding,
      margin: margin,
    );
  }
}
