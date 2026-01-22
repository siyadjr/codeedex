class ImageHelper {
  static const _base = 'https://sungod.demospro2023.in.net';

  static String category(String image) {
    return '$_base/images/category/$image';
  }

  static String product(String image) {
    return image.startsWith('http') ? image : '$_base/$image';
  }
}
