

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/app_text_styles.dart';
import 'semantic_text_widget.dart';

class LogoWidget extends StatelessWidget {
  final String? image;
  final double height;
  final double width;
  final String? text;
  final String? svgImage;
  final TextStyle? textStyle;
  final Color? svgColor;
  final CrossAxisAlignment crossAxisAlignment;
  const LogoWidget({
    super.key,
    this.image,
    this.height = 100,
    this.width = 200,
    this.text,
    this.svgImage,
    this.textStyle,
    this.svgColor,
    this.crossAxisAlignment = CrossAxisAlignment.center
  });

  @override
  Widget build(BuildContext context) {
    // Если есть текст, показываем Row с изображением и текстом
    if (text != null && text!.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          _buildImage(),
          const SizedBox(width: 8),
          Flexible(
            child: SemanticTextWidget(
              semanticLabel: text!,
              text: text!,
              style: textStyle ?? AppTextStyles.logoText,
              textAlign: TextAlign.start,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      );
    }
    
    // Если текста нет, показываем только изображение
    return _buildImage();
  }


  Widget _buildImage() {
    // Приоритет: svgImage -> image
    if (svgImage != null && svgImage!.isNotEmpty) {
      return SvgPicture.asset(
        svgImage!,
        height: height,
        width: width,
        // colorFilter: svgColor != null
        //     ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
        //     : null,
      );
    } else if (image != null && image!.isNotEmpty) {
      return Image.asset(
        image!,
        height: height,
        width: width,
        fit: BoxFit.contain,
      );
    } else {
      // Fallback если ничего не передано
      return Container(
        height: height,
        width: width,
        color: Colors.grey[300],
        child: const Icon(Icons.image, color: Colors.grey),
      );
    }
  }
}
