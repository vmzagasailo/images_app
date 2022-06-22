import 'package:flutter/cupertino.dart';
import 'package:images_app/di/get_it.dart';
import 'package:images_app/presentation/bloc/blocs.dart';

extension ContextExt on BuildContext {
  Blocs get blocs => locator.get<Blocs>();
}
