import 'package:flutter/material.dart';
import 'package:images_app/presentation/resources/app_colors.dart';
import 'package:images_app/presentation/screens/image_screen.dart';
import 'package:images_app/presentation/widgets/image_widget.dart';

class GridViewWidget extends StatelessWidget {
  final List<String> images;
  final ScrollController controller;

  GridViewWidget({
    Key? key,
    required this.controller,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      children: [
        GridView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              crossAxisSpacing: 3,
              childAspectRatio: 3 / 5),
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ImageWidget(
              imageUrl: images[index],
              onTap: () => _onTapImage(context, images[index]),
            );
          },
        ),
        if (images.length > 104)
          Container(
            height: 40,
            color: AppColors.softGrey,
            child: Center(
              child: Text(
                'end of story :(',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
      ],
    );
  }

  void _onTapImage(BuildContext context, String imageUrl) async {
    await Navigator.pushNamed(context, ImageScreen.routeName,
        arguments: imageUrl);
  }
}
