import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/extensions/context.dart';

class ImageBlocProvider extends StatelessWidget {
  final Widget child;

  const ImageBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.blocs.images,
      child: child,
    );
  }
}
