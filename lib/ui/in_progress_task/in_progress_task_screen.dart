import 'package:flutter/material.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';

import 'in_progress_task_binding.dart';

class InProgressTaskScreen extends BaseView<InProgressTaskController> {
  @override
  Widget vBuilder() => Scaffold(
    body: _body(),
  );

  _body() {
    return Text("InProgress task screen");
  }




}