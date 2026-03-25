class AssetHelper {
  // Use .webp for images to significantly reduce bundle size,
  // currently fallback to .png if the user hasn't converted yet.
  static const String imageExtension = '.png'; // TODO: Change to '.webp' after converting assets

  static const String audioExtension = '.mp3';

  /// Returns the image path for a specific category and item
  static String getImagePath(String category, String itemName) {
    return 'assets/images/$category/$itemName$imageExtension';
  }

  /// Returns the audio path for a specific category and item
  static String getAudioPath(String category, String itemName) {
    return 'assets/audio/$category/$itemName$audioExtension';
  }
}
