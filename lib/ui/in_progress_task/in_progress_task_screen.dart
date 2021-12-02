import 'package:flutter/material.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';

import 'in_progress_task_binding.dart';

class InProgressTaskScreen extends BaseView<InProgressTaskController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "In Progress",
            style: TextStyle(fontSize: 30.t),
          ),
        ),
        body: _body(),
      );

  _body() {
    return ListView.builder(
        itemCount: controller.listTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.all(10.w),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleTask(controller.listTasks[index]),
                  _buildContenTask(controller.listTasks[index])
                ],
              ));
        });
  }

  _buildTitleTask(Task listTask) {
    return Text(
      listTask.name.toString(),
      style: TextStyle(fontSize: 30.t, fontWeight: FontWeight.w700),
    );
  }

  _buildContenTask(Task listTask) {
    return Text(
      listTask.content.toString(),
      style: TextStyle(fontSize: 20.t, fontWeight: FontWeight.w300),
    );
  }
}
