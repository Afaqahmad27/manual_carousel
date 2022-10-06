import 'package:flutter/material.dart';

class SelectedPhoto extends StatelessWidget {
  SelectedPhoto({this.numberOfDots, this.photoIndexNo, Key? key})
      : super(key: key);
  final int? photoIndexNo;
  final int? numberOfDots;

  Widget _InActive() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _Active() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          height: 12,
          width: 12,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black54, blurRadius: 5, spreadRadius: 0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots!; ++i) {
      dots.add(i == photoIndexNo ? _Active() : _InActive());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
