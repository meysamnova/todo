import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:todo/controllers/task_controller.dart';
import 'package:todo/pages/newtask_page.dart';
import '../constant.dart';
import '../controllers/changethemecontroller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
static var aa = const SystemUiOverlayStyle(
      statusBarColor: kLightBlueColor,
      statusBarIconBrightness: Brightness.light);
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(aa);
    return Scaffold(
      body: const SafeArea(
          child: Column(
        children: [
          TopStack(),
          BottomStack(),
        ],
      )),

      //! Fab
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.find<TaskController>().isEditing = false;

            NewTaskPage.titleController.text = '';
            NewTaskPage.subTitleController.text = '';
            Get.toNamed('/newtask')!.then((value) {
              SystemChrome.setSystemUIOverlayStyle(aa);
            });
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          )),
    );
  }
}

//! TopStack
class TopStack extends StatelessWidget {
  const TopStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: kLightBlueColor,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.find<ChangeThemecontroller>().toggleTheme();
                  },
                  icon:
                      Icon(Icons.sunny, color: Theme.of(context).primaryColor)),
              Obx(
                () => Text('${Get.find<TaskController>().tasks.length} Tasks',
                    style: const TextStyle(color: kWhiteColor)),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

//! BottomStack
class BottomStack extends StatelessWidget {
  const BottomStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        // height: double.maxFinite,
        child: ListView.separated(
          
            itemBuilder: (context, index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              //! Delete
                  onLongPress: () {
                    Get.find<TaskController>().tasks.removeAt(index);
                  },
                  //! Edit
                  onTap: () {
                    Get.find<TaskController>().isEditing = true;
                    Get.find<TaskController>().editIndex = index;
                    NewTaskPage.titleController.text =
                        Get.find<TaskController>().tasks[index].title;
                    NewTaskPage.subTitleController.text =
                        Get.find<TaskController>().tasks[index].subTitle;
                    Get.toNamed('/newtask')!.then((value) => SystemChrome.setSystemUIOverlayStyle(HomePage.aa));
                  },
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  Get.find<TaskController>()
                                      .tasks[index]
                                      .subTitle,
                                  style: const TextStyle(color: kGreyColor)),
                              Text(
                                Get.find<TaskController>().tasks[index].title,
                                  // style:  TextStyle(color: Theme.of(context).colorScheme.primary)
                              ),
                              Text(
                                '${Get.find<TaskController>().tasks[index].date} . ${Get.find<TaskController>().tasks[index].time}',
                                style: const TextStyle(
                                    color: kRedAccent, fontSize: 20),
                              ),
                            ],
                          ),
                          Checkbox(
                            value:
                                Get.find<TaskController>().tasks[index].status,
                            onChanged: (aa) {
                              Get.find<TaskController>().tasks[index].status =
                                  !Get.find<TaskController>()
                                      .tasks[index]
                                      .status;
                              Get.find<TaskController>().tasks[index] =
                                  Get.find<TaskController>().tasks[index];
                            },
                            activeColor: kLightBlueColor,
                          ),
                        ],
                      )),
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: Get.find<TaskController>().tasks.length),
      ),
    );
  }
}
