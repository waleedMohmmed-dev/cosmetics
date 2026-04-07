import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String? image;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
  });

  bool get _isEmpty =>
      image == null || image!.trim().isEmpty || image == 'null';

  bool get _isNetwork =>
      !_isEmpty && (image!.startsWith('http') || image!.startsWith('https'));

  bool get _isSvg => !_isEmpty && image!.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    if (_isEmpty) {
      return _placeholder();
    }

    if (_isSvg) {
      return _isNetwork ? _networkSvg() : _assetSvg();
    }

    return _isNetwork ? _networkImage() : _assetImage();
  }

  // ================= PLACEHOLDER =================
  Widget _placeholder() {
    return SizedBox(
      width: width,
      height: height,
      child: const Center(child: Icon(Icons.image, size: 30)),
    );
  }

  Widget _networkImage() {
    return Image.network(
      image!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return const Center(child: CircularProgressIndicator());
      },
      errorBuilder: (context, error, stackTrace) {
        return AppImage(
          image:
              /// prefer assets
              'https://d13kjxnqnhcmn2.cloudfront.net/AcuCustom/Sitename/DAM/064/404s_-_Main.jpg',
          width: width,
          height: height,
          fit: fit,
          color: color,
        );
      },
    );
  }

  Widget _assetImage() {
    return Image.asset(
      image!,
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return _placeholder();
      },
    );
  }

  Widget _networkSvg() {
    return SvgPicture.network(
      image!,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (context) =>
          const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _assetSvg() {
    return SvgPicture.asset(
      image!,
      width: width,
      height: height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}
