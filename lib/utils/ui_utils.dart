import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:images_app/presentation/resources/app_colors.dart';

class UiUtils {
  static Widget SimpleLoaderIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget CustomLoaderIndicator() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.softGrey,
        ),
        child: Row(
          children: [
            const Spacer(),
            CircularProgressIndicator(),
            const SizedBox(width: 10),
            Text('Loading...'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
