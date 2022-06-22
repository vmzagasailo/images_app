import 'package:images_app/di/get_it.dart';
import 'package:images_app/presentation/bloc/image/image_bloc.dart';

class Blocs {
  ImageBloc get images => locator.get<ImageBloc>();
}
