import 'dart:math' as math;

import 'package:diagram_editor/diagram_editor.dart';
import 'package:flutter/material.dart';
import 'package:ojt_test/data/component_data.dart';
import 'package:ojt_test/policies/custom_policy.dart';

// Component 사이즈 정의
mixin MyCanvasPolicy implements CanvasPolicy, CustomPolicy {
  var sizes = [
    const Size(170, 50),
  ];

//캔버스 + 마우스 제스처 관리
  @override
  onCanvasTapUp(TapUpDetails details) {
    canvasWriter.model.hideAllLinkJoints();

    if (isReadyToAddParent) {
      isReadyToAddParent = false;
      canvasWriter.model.updateComponent(selectedComponentId!);
    } else {
      if (selectedComponentId != null) {
        hideComponentHighlight(selectedComponentId!);
        selectedComponentId = null;
      } else {
        canvasWriter.model.addComponent(
          ComponentData(
            size: sizes[math.Random().nextInt(sizes.length)],
            minSize: const Size(32, 30),
            position:
                canvasReader.state.fromCanvasCoordinates(details.localPosition),
            data: MyComponentData(),
          ),
        );
      }
    }
  }
}
