import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_unhas_new/constants/color_const.dart';

class MyUnhasLoading extends StatelessWidget {
  final bool withScaffold;
  const MyUnhasLoading({super.key, this.withScaffold = false});

  @override
  Widget build(BuildContext context) {
    return withScaffold
        ? Scaffold(
            body: content(),
            backgroundColor: Palette.grey,
          )
        : content();
  }

  Center content() {
    return const Center(
      child: SpinKitCubeGrid(
        color: Palette.red,
        size: 50.0,
      ),
    );
  }
}
