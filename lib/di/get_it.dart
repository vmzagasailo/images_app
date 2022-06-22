import 'package:get_it/get_it.dart';
import 'package:images_app/data/repository/image/repository.dart';
import 'package:images_app/presentation/bloc/blocs.dart';
import 'package:images_app/presentation/bloc/image/image_bloc.dart';
import 'package:images_app/utils/logger.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AppLogger>(AppLogger());

  locator.registerSingleton<ImageRepositoryImpl>(ImageRepositoryImpl());

  locator.registerSingleton<ImageBloc>(
    ImageBloc(
      imageRepo: locator.get<ImageRepositoryImpl>(),
      appLogger: locator.get<AppLogger>(),
    ),
  );
  locator.registerSingleton<Blocs>(Blocs());
}
