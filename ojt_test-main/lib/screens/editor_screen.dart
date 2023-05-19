import 'package:flutter/material.dart';
import 'package:diagram_editor/diagram_editor.dart';
import 'package:ojt_test/component/button_component.dart';
import 'package:ojt_test/policies/policy_set.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  MyPolicySet myPolicySet = MyPolicySet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EDITOR',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // ------------ 배경
            Container(
              color: Colors.white,
            ),
            // ------------ [ Diagram Editor ]
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DiagramEditor(
                diagramEditorContext:
                    DiagramEditorContext(policySet: myPolicySet),
              ),
            ),
            // ------------ [ Delete All ] 버튼
            GestureDetector(
              onTap: () {
                myPolicySet.deleteAllComponents();
              },
              child: const ButtonComponent(
                text: 'Delete All',
                fontSize: 16.0,
                textColor: Colors.black,
                width: 120,
                height: 40,
                backgroundColor: Colors.purple,
              ),
            )
          ],
        ),
      ),
    );
  }
}
