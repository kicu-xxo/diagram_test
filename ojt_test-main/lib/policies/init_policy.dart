import 'package:diagram_editor/diagram_editor.dart';

import 'package:flutter/material.dart';
import 'package:ojt_test/data/component_data.dart';

//선 스타일 찾음

// EditorScreen 으로 이동했을 때 화면에 보여질 초기 Component들 ( like 예시 )
mixin MyInitPolicy implements InitPolicy {
  @override
  initializeDiagramEditor() {
    canvasWriter.state.setCanvasColor(const Color.fromRGBO(224, 224, 224, 1));

    var cd1 = getSmallComponentData(const Offset(220, 100));
    var cd2 = getSmallComponentData(const Offset(220, 180));
    var cd3 = getSmallComponentData(const Offset(400, 100));
    var cd4 = getSmallComponentData(const Offset(400, 180));

    var cd5 = getBigComponentData(const Offset(80, 80));
    var cd6 = getBigComponentData(const Offset(380, 80));

    canvasWriter.model.addComponent(cd1);
    canvasWriter.model.addComponent(cd2);
    canvasWriter.model.addComponent(cd3);
    canvasWriter.model.addComponent(cd4);
    canvasWriter.model.addComponent(cd5);
    canvasWriter.model.addComponent(cd6);

    canvasWriter.model.moveComponentToTheFront(cd5.id);
    canvasWriter.model.moveComponentToTheFront(cd6.id);

    canvasWriter.model.moveComponentToTheFront(cd1.id);
    canvasWriter.model.moveComponentToTheFront(cd2.id);
    canvasWriter.model.moveComponentToTheFront(cd3.id);
    canvasWriter.model.moveComponentToTheFront(cd4.id);

    canvasWriter.model.setComponentParent(cd1.id, cd5.id);
    canvasWriter.model.setComponentParent(cd2.id, cd5.id);

    canvasWriter.model.setComponentParent(cd3.id, cd6.id);
    canvasWriter.model.setComponentParent(cd4.id, cd6.id);

//처음 화면에서 보이는 작은 컴포넌트 연결 설정 부분
//LinkStyle에 설정되어있는 스타일로 변경 가능함. (스타일 추가도 가능)
//선 종류, 색상, 화살 크기, 화살 종류, 선 넓이 가능
    canvasWriter.model.connectTwoComponents(
      sourceComponentId: cd1.id,
      targetComponentId: cd3.id,
      linkStyle: LinkStyle(
        lineWidth: 2,
        arrowType: ArrowType.arrow,
        color: Colors.red,
      ),
    );
    canvasWriter.model.connectTwoComponents(
      sourceComponentId: cd4.id,
      targetComponentId: cd2.id,
      linkStyle: LinkStyle(
        lineWidth: 2,
        arrowType: ArrowType.arrow,
        lineType: LineType.dotted,
      ),
    );
  }

//작은 컴포넌트 조절
  ComponentData getSmallComponentData(Offset position) {
    return ComponentData(
      size: const Size(80, 64),
      minSize: const Size(72, 48),
      position: position,
      data: MyComponentData(),
    );
  }

// 큰 컴포넌트 조절
  ComponentData getBigComponentData(Offset position) {
    return ComponentData(
      size: const Size(240, 180),
      minSize: const Size(72, 48),
      position: position,
      data: MyComponentData(),
    );
  }
}
