import 'package:flutter/material.dart';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:ojt_test/policies/custom_policy.dart';

mixin MyComponentPolicy implements ComponentPolicy, CustomPolicy {
  late Offset lastFocalPoint;

  @override
  onComponentTap(String componentId) {
    hideComponentHighlight(selectedComponentId!);
    canvasWriter.model.hideAllLinkJoints();

    if (isReadyToAddParent) {
      canvasWriter.model.setComponentParent(selectedComponentId!, componentId);
      selectedComponentId = null;
      isReadyToAddParent = false;
    } else {
      bool connected = connectComponents(selectedComponentId!, componentId);
      if (connected) {
        selectedComponentId = null;
      } else {
        selectedComponentId = componentId;
        highlightComponent(componentId);
      }
    }
  }

  @override
  onComponentScaleStart(componentId, details) {
    lastFocalPoint = details.localFocalPoint;
  }

// 자식과 같이 움직이는거 관련..?
  @override
  onComponentScaleUpdate(componentId, details) {
    Offset positionDelta = details.localFocalPoint - lastFocalPoint;

    canvasWriter.model.moveComponentWithChildren(componentId, positionDelta);

    lastFocalPoint = details.localFocalPoint;
  }

  bool connectComponents(String sourceComponentId, String targetComponentId) {
    // ignore: unnecessary_null_comparison
    if (sourceComponentId == null) {
      return false;
    }
    if (sourceComponentId == targetComponentId) {
      return false;
    }
    // test if the connection between two components already exists (one way)
    if (canvasReader.model.getComponent(sourceComponentId).connections.any(
        (connection) =>
            (connection is ConnectionOut) &&
            (connection.otherComponentId == targetComponentId))) {
      return false;
    }

    canvasWriter.model.connectTwoComponents(
      sourceComponentId: sourceComponentId,
      targetComponentId: targetComponentId,
      linkStyle: LinkStyle(
        lineWidth: 2,
        arrowType: ArrowType.arrow,
      ),
    );

    return true;
  }
}
