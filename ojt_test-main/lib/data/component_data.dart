import 'package:flutter/material.dart';

// 컴포넌트 배경색, highlight 설정
class MyComponentData {
  bool isHighlightVisible;
  Color color = const Color.fromARGB(255, 236, 232, 232);

  MyComponentData({this.isHighlightVisible = false});

  void switchHighlight() {
    isHighlightVisible = !isHighlightVisible;
    // print('$isHighlightVisible');
  }

  showHighlight() {
    isHighlightVisible = true;
  }

  hideHighlight() {
    isHighlightVisible = false;
  }
}
