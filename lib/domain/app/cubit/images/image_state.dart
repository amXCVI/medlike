part of 'image_cubit.dart';


class ImageState {
  final Map<String, String> imageUrls;

  ImageState({
    this.imageUrls = const {} 
  });

  bool hasUrl(String url) {
    return imageUrls.containsKey(url);
  }

  String getUrl(String url) {
    return imageUrls[url] ?? '';
  }


  ImageState copyWith({
    Map<String, String>? imageUrls
  }) {
    return ImageState(
      imageUrls: imageUrls ?? this.imageUrls
    );
  }
}
