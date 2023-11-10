import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_app/common/constant.dart';

import '../net/api_helper.dart';
import '../net/dio_utils.dart';

class SubmissionPage extends StatefulWidget {
  const SubmissionPage({Key? key}) : super(key: key);

  @override
  State<SubmissionPage> createState() => _SubmissionPageState();
}

class _SubmissionPageState extends State<SubmissionPage> {
  // List<TextEditingController> controllers = [];

  TextEditingController authorController = new TextEditingController();
  TextEditingController titleController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController coverUrlController = new TextEditingController();
  TextEditingController summaryController = new TextEditingController();
  TextEditingController downloadUrlController = new TextEditingController();
  int selectedValue = 1; // 初始选择的值

  @override
  void initState() {
    super.initState();
    // 初始化列表
    print("初始化列表");
    // controllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.miancolor,
        title: Text(
          "投稿",
          style: TextStyle(
            color: Constant.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "有积分奖励；提交的资源不得包含广告、侵权细腻，百度网盘地址间一包含密码！",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // 添加一些间距

            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "原创",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Radio(
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "转载",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Radio(
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "标题:",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: "输入标题",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "作者",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: authorController,
                        decoration: InputDecoration(
                          hintText: "输入作者",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "价格",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: priceController,
                        decoration: InputDecoration(
                          hintText: "输入价格",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "简介",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: summaryController,
                        decoration: InputDecoration(
                          hintText: "输入简介",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "封面",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: coverUrlController,
                        decoration: InputDecoration(
                          hintText: "输入封面地址",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "下载地址",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        controller: downloadUrlController,
                        decoration: InputDecoration(
                          hintText: "输入下载地址",
                          // border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),

            /**
                使用子列表组件,这边不用了。。。。。。。。。
             *
             */
            // 使用子列表组件
//             ListView.builder(
//               itemCount: controllers.length,
//               shrinkWrap: true,
// //              遍历，传入组件中
//               itemBuilder: (context, index) {
//                 return SubmitItem(controller: controllers[index],onValueChanged: this.onValueChanged,title: "测试",);
//               },
//             ),

            // 添加按钮来动态添加输入框
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       TextEditingController item = TextEditingController();
            //       item.text = "输入框";
            //       controllers.add(item);
            //     });
            //   },
            //   child: Text("添加输入框"),
            // ),
            GestureDetector(
              onTap: () {
                // 登录
                _login();
              },
              child: Container(
                width: 1000,
                height: 40,
                color: Constant.miancolor,
                alignment: Alignment.center,
                child: Text(
                  "提交",
                  style: TextStyle(color: Constant.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 登录接⼝
  void _login() async {
    var result = await DioUtils.instance.postRequest(
        url: ApiHelper.contribute2,

        data: {
          "author": authorController.text,
          "title": titleController.text,
          "isOriginal": selectedValue,
          "price": priceController.text,
          "downloadUrl": downloadUrlController.text,
          "cover": coverUrlController.text,
          "summary": summaryController.text
        });
    print(result.data.toString());
    if(result.success ==true){
      Fluttertoast.showToast(msg: "提交成功", gravity: ToastGravity.CENTER);
      // 在当前页面执行页面回退
      // 弹出直到指定路由名称的页面
      // Navigator.popUntil(context, ModalRoute.withName('/my_submission'));



    }else{
      Fluttertoast.showToast(msg: "失败了，请重新提交", gravity: ToastGravity.CENTER);

    }
  }

  // @override
  // void dispose() {
  //   for (var controller in controllers) {
  //     controller.dispose();
  //   }
  //   super.dispose();
  // }

  // 在父组件中定义一个回调函数
  void onValueChanged(String value) {
    // 在这里可以处理从子组件传递的参数
    print("Value from child: $value");
  }
}
