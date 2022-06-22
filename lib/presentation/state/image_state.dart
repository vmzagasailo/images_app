class ImageState {
  final bool isLoading;
  final List<String> images;
  final String? error;

  const ImageState({
    this.isLoading = false,
    this.images = const [],
    this.error,
  });

  ImageState copyWith({
    bool? isLoading,
    List<String>? images,
    String? error,
  }) {
    return ImageState(
      isLoading: isLoading ?? this.isLoading,
      images: images ?? this.images,
      error: error ?? this.error,
    );
  }
}
