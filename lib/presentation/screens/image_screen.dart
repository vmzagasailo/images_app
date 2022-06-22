import 'package:flutter/material.dart';
import 'package:images_app/presentation/widgets/image_widget.dart';
import 'package:images_app/presentation/widgets/simple_text_button.dart';

class ImageScreen extends StatelessWidget {
  static const routeName = '/image-screen';

  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      body: _buildBody(context, imageUrl),
    );
  }

  Widget _buildBody(BuildContext context, String imageUrl) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          _buildImageSection(context, imageUrl),
          Positioned(
            bottom: 5,
            child: SimpleTextButton(
              title: 'Share',
              onPressed: _onSharePressed,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(BuildContext context, String imageUrl) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ImageWidget(imageUrl: imageUrl),
    );
  }

  void _onSharePressed() {}
}
