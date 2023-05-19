import 'package:diagram_editor/diagram_editor.dart';
import 'package:ojt_test/policies/canvas_policy.dart';
import 'package:ojt_test/policies/component_design_policy.dart';
import 'package:ojt_test/policies/component_policy.dart';
import 'package:ojt_test/policies/component_widgets_policy.dart';
import 'package:ojt_test/policies/custom_policy.dart';
import 'package:ojt_test/policies/init_policy.dart';

class MyPolicySet extends PolicySet
    with
        MyInitPolicy, // Editor에 나타날 초기 Component들 (예시)
        MyComponentDesignPolicy, // 하나의 Component ( 여기서 커스터마이징 가능 )
        MyCanvasPolicy, // Component 사이즈 정의
        MyComponentPolicy, // 각 Component에 대한 기능들 ( highlight, 크기변경, 연결 )
        MyComponentWidgetsPolicy, // Component 클릭시 보이는 메뉴들
        CustomPolicy, // 이외의 기능들 ( 모두 삭제, highlight 기능 )
        //
        CanvasControlPolicy, // canvas 이동 및 확대/축소
        LinkControlPolicy,
        LinkJointControlPolicy,
        LinkAttachmentRectPolicy {}
