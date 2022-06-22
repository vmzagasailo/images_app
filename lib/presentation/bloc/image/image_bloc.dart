import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/data/repository/image/repository.dart';
import 'package:images_app/presentation/state/image_state.dart';
import 'package:images_app/utils/logger.dart';

class ImageBloc extends Cubit<ImageState> {
  final ImageRepositoryImpl imageRepo;
  final AppLogger appLogger;
  ImageBloc({
    required this.imageRepo,
    required this.appLogger,
  }) : super(const ImageState()) {
    getImages();
  }
  int count = 10;

  Future<void> getImages() async {
    appLogger.logDebug(message: 'ImageBloc.getImages()');
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(
          images: imageRepo.getImages().take(count).toList(), isLoading: false),
    );
    count += 10;
  }
}
