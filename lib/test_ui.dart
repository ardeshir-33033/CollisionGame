import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestUi extends StatefulWidget {
  const TestUi({Key? key}) : super(key: key);

  @override
  State<TestUi> createState() => _TestUiState();
}

class _TestUiState extends State<TestUi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 20,
            width: 20,
            child: SvgPicture.asset(
                "packages/mc_crud_test/assets/icons/brush.svg")),
        Container(
            height: 20,
            width: 20,
            child: Image.asset(
                "packages/mc_crud_test/assets/images/green_call.png")),
      ],
    );
  }
}
