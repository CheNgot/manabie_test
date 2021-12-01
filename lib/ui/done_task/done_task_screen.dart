import 'package:flutter/material.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';
import 'package:manabie_interview/ui/done_task/done_task_binding.dart';

class DoneTaskScreen extends BaseView<DoneTaskController> {
  @override
  Widget vBuilder() => Scaffold(
    body: _body(),
  );

  _body() {
    return Text("Done task screen");
  }




}