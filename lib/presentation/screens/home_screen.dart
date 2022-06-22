import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_app/presentation/bloc/image/image_bloc.dart';
import 'package:images_app/presentation/state/image_state.dart';
import 'package:images_app/presentation/widgets/grid_view_widget.dart';
import 'package:images_app/extensions/context.dart';
import 'package:images_app/utils/ui_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_pagination);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    final deviceSize = MediaQuery.of(context).size;
    return BlocBuilder<ImageBloc, ImageState>(
      bloc: context.blocs.images,
      builder: (_, state) {
        return Stack(
          children: [
            GridViewWidget(
              controller: _scrollController,
              images: state.images,
            ),
            state.isLoading
                ? Positioned(
                    bottom:
                        state.images.length < 10 ? deviceSize.height * 0.5 : 5,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: state.images.length < 10
                          ? UiUtils.SimpleLoaderIndicator()
                          : UiUtils.CustomLoaderIndicator(),
                    ),
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  void _pagination() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      context.blocs.images.getImages();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
