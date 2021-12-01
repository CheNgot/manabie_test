import 'package:flutter/material.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';

import 'all_task_binding.dart';

class AllTaskScreen extends BaseView<AllTaskController> {
  @override
  Widget vBuilder() => Scaffold(
    body: _body(),
  );

  _body() {
    return Text("all_task screen");
  }




}