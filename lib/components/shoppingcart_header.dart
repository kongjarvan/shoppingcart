import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoppingcart/constants.dart';

class ShoppingCartHeader extends StatefulWidget {
  const ShoppingCartHeader({Key? key}) : super(key: key);

  @override
  State<ShoppingCartHeader> createState() => _ShoppingCartHeaderState();
}

class _ShoppingCartHeaderState extends State<ShoppingCartHeader> {
  // 상태변수
  int selectedId = 0;

  // 상수
  List<String> selectedPic = [
    "assets/p1.jpeg",
    "assets/p2.jpeg",
    "assets/p3.jpeg",
    "assets/p4.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeaderPic(),
        _buildHeaderSelector(),
      ],
    );
  }

  _buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AspectRatio(
          aspectRatio: 5 / 3,
          child: Image.asset(
            selectedPic[selectedId],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _buildHeaderSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildHeaderSelectorButton(0, Icons.directions_bike),
        _buildHeaderSelectorButton(1, Icons.motorcycle),
        _buildHeaderSelectorButton(2, CupertinoIcons.car_detailed),
        _buildHeaderSelectorButton(3, CupertinoIcons.airplane),
      ],
    );
  }

  Widget _buildHeaderSelectorButton(int id, IconData micon) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        // 색상 앞에 k를 붙여서 찾기 쉽게 만듬 (컨벤션, 약속)
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          setState(() {
            selectedId = id;
          });
        },
        icon: Icon(
          micon,
          color: Colors.black,
        ),
      ),
    );
  }
}
