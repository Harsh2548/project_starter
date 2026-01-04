import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/data/values/images.dart';

class DataStateWidget extends StatelessWidget {
  final DataStateType type;
  final String? message;

  const DataStateWidget({
    super.key,
    required this.type,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath;
    String displayMessage;

    switch (type) {
      case DataStateType.noData:
        imagePath = Images.noData;
        displayMessage = message ?? '';
        break;
      case DataStateType.error:
        imagePath = Images.noData;
        displayMessage = message ?? '';
        break;
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 150.h,width: 150.w,),
          // const SizedBox(height: 16),
          Text(
            displayMessage,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

enum DataStateType { noData, error }
