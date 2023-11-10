import 'package:flutter/material.dart';

class SubmitItem extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onValueChanged; // 回调函数
  final String title;

  SubmitItem({required this.controller, required this.onValueChanged,required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              this.title,
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
              controller: controller,
              decoration: InputDecoration(
                hintText: "输入标题",
                border: OutlineInputBorder(),
              ),
              onChanged: (value){
                // 当用户输入发生变化时，调用回调函数并传递参数
                onValueChanged(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
