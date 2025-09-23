import 'package:flutter/material.dart';
import 'responsive_layout.dart';

class ImageWidget extends StatelessWidget {
  final List<String> imagePaths;
  final double? aspectRatio;
  final double spacing;
  final EdgeInsets? padding;
  final double? maxWidth;
  final int? crossAxisCount;

  const ImageWidget({
    super.key,
    required this.imagePaths,
    this.aspectRatio,
    this.spacing = 16.0,
    this.padding,
    this.maxWidth,
    this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePaths.isEmpty) {
      return const SizedBox.shrink();
    }

    if (ResponsiveLayout.isMobile(context)) {
      return _buildMobileLayout(context);
    } else {
      return _buildDesktopLayout(context);
    }
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        children: imagePaths.map((imagePath) {
          return Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: _buildImageContainer(context, imagePath),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final crossAxisCount = this.crossAxisCount ?? (ResponsiveLayout.isTablet(context) ? 4 : 5);
    final screenWidth = MediaQuery.of(context).size.width;
    final availableWidth = screenWidth / crossAxisCount - spacing * 2;
    final phoneAspectRatio = aspectRatio ?? _getDefaultAspectRatio(context);
    
    // Задаем максимальную ширину для компактного отображения
    final defaultMaxWidth = ResponsiveLayout.isTablet(context) ? 180.0 : 150.0;
    final maxWidth = this.maxWidth ?? defaultMaxWidth;
    final finalWidth = availableWidth > maxWidth ? maxWidth : availableWidth;
    final calculatedHeight = finalWidth / phoneAspectRatio;
    final finalHeight = calculatedHeight + (ResponsiveLayout.isTablet(context) ? 35.0 : 30.0);
    
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
          childAspectRatio: finalWidth / finalHeight,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: finalWidth,
            height: finalHeight,
            child: _buildImageContainer(context, imagePaths[index]),
          );
        },
      ),
    );
  }

  Widget _buildImageContainer(BuildContext context, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Icon(
                  Icons.image_not_supported,
                  color: Colors.grey,
                  size: 48,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  double _getDefaultAspectRatio(BuildContext context) {
    // Для скриншотов телефона используем соотношение сторон 9:16
    // что соответствует большинству современных смартфонов
    // Возвращаем соотношение ширина/высота = 9/16 = 0.5625
    return 9 / 16;
  }
}
