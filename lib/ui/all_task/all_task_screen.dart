import 'package:flutter/material.dart';
import 'package:manabie_interview/base/base_view_view_model.dart';
import 'package:manabie_interview/base/database/entity/task.dart';
import 'package:manabie_interview/shared/utils/dimens.dart';

import 'all_task_binding.dart';

class AllTaskScreen extends BaseView<AllTaskController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "All Task",
            style: TextStyle(fontSize: 30.t),
          ),
        ),
        body: _body(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showDialogAddTask(Get.context);
          },
          label: const Text('Add task'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      );

  _body() {
    return ListView.builder(
        itemCount: controller.listTasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: double.infinity,
              child: Row(
                children: [
                  Checkbox(
                      value: controller.listTasks[index].isComplete,
                      onChanged: (_) {
                        controller.toggle(index);
                      }),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitleTask(controller.listTasks[index]),
                      _buildContenTask(controller.listTasks[index])
                    ],
                  ),
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

  Future<void> _showDialogAddTask(BuildContext? context) async {
    var textNameController = TextEditingController();
    var textContentController = TextEditingController();

    return showDialog<void>(
      context: context as BuildContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: textNameController,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: textContentController,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Add Task'),
              onPressed: () {
                if (textContentController.text.isNotEmpty &&
                    textContentController.text.isNotEmpty) {
                  Navigator.of(context).pop();
                  controller.insertTask(textNameController.value.text,
                      textContentController.value.text);
                  controller.getListTask();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
