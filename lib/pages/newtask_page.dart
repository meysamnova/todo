   import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/constant.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/task_model.dart';

class NewTaskPage extends StatelessWidget {
  const NewTaskPage({super.key});
  static TextEditingController titleController = TextEditingController();
  static TextEditingController subTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  final box = GetStorage();
    var aa = const SystemUiOverlayStyle(
        statusBarColor: kWhiteColor, statusBarIconBrightness: Brightness.dark);
    var bb = const SystemUiOverlayStyle(
        statusBarColor: kSemiBlackColor,
        statusBarIconBrightness: Brightness.light);
    box.read('theme') ?? true 
        ? SystemChrome.setSystemUIOverlayStyle(aa)
        : SystemChrome.setSystemUIOverlayStyle(bb);

    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CustomAppbar(),
            // Whatareyouplanning(),
            AddNote(),

            TaskTextField(),

            // Date(),
            // SizedBox(height: 20),
            // Category(),
            AddButton()
          ]),
        ),
      ),
    );
  }
}

//! AddButton
class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        width: Get.width,
        child: ElevatedButton(
          onPressed: () {
            var datetime = DateTime.now();
            var day = datetime.day;
            var month = datetime.month;
            var year = datetime.year;
            var date = '$year/$month/$day';
            var hour = datetime.hour;
            var minute = datetime.minute;
            var time = '$hour:$minute';
            TaskModel taskmodel1 = TaskModel(
                title: NewTaskPage.titleController.text,
                date: date,
                time: time,
                status: false,
                subTitle: NewTaskPage.subTitleController.text);
            if (NewTaskPage.titleController.text.isEmpty) {
            } else if (Get.find<TaskController>().isEditing == false) {
              Get.find<TaskController>().tasks.add(taskmodel1);
            } else {
              Get.find<TaskController>()
                  .tasks[Get.find<TaskController>().editIndex]
                  .title = NewTaskPage.titleController.text;
              Get.find<TaskController>()
                  .tasks[Get.find<TaskController>().editIndex]
                  .subTitle = NewTaskPage.subTitleController.text;
              Get.find<TaskController>()
                      .tasks[Get.find<TaskController>().editIndex] =
                  Get.find<TaskController>()
                      .tasks[Get.find<TaskController>().editIndex];
            }
            Get.back();
          },
          child: Get.find<TaskController>().isEditing == false
              ? const Text('Add')
              : const Text('Edit'),
        ));
  }
}

//! Date
class Date extends StatelessWidget {
  const Date({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 25),
      child: const Row(children: [
        Icon(Icons.alarm),
        SizedBox(width: 10),
        Text('2023/02/03')
      ]),
    );
  }
}

//! AddNote
class AddNote extends StatelessWidget {
  const AddNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: TextField(
        
        controller: NewTaskPage.subTitleController,
        cursorColor: kLightBlueColor,
        decoration: const InputDecoration(
          hintText: 'Title',
          hintStyle: TextStyle(color: kGreyColor),
          prefixIcon: Icon(Icons.category),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }
}

//! CAtegory
class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 20),
      child: const Row(children: [
        Icon(Icons.category_sharp),
        SizedBox(width: 10),
        Text('Category')
      ]),
    );
  }
}

//! TaskTextField
class TaskTextField extends StatelessWidget {
  const TaskTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 30),
      child: TextField(
        controller: NewTaskPage.titleController,
        maxLines: 3,
        cursorHeight: 25,
        cursorColor: kLightBlueColor,
        decoration: const InputDecoration(
                    hintText: 'Description',
          hintStyle: TextStyle(color: kGreyColor),

          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: newTaskBorder)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: newTaskBorder)),
        ),
      ),
    );
  }
}

//! Whatareyouplanning
class Whatareyouplanning extends StatelessWidget {
  const Whatareyouplanning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 50),
      child: Text(
        'what are you planning?',
        style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}

//! CustomAppbar
class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Get.find<TaskController>().isEditing == false
                ? const Text('New Task')
                : const Text('Edit Tast'),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
