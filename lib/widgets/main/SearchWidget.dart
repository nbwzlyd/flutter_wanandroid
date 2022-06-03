import 'package:flutter/material.dart';

/// @author longzipeng
/// @创建时间：2022/3/29
/// 查询组件
class SearchWidget extends StatefulWidget {
  final double height; // 高度
  final double width; // 宽度
  final String hintText; // 输入提示
  final ValueChanged<String> onEditingComplete; // 编辑完成的事件回调

  const SearchWidget({Key key,
        this.height,
        this.width,
        this.hintText,
        this.onEditingComplete})
      : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  /// 清除查询关键词
  clearKeywords() {
    controller.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var width = widget.width ?? constrains.maxWidth / 2; // 父级宽度
      var height = widget.width ?? widget.height ?? 30;
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(height)),
        child: TextField(
            controller: controller,
            style: TextStyle(color: Colors.white, fontSize: 14),
            decoration: InputDecoration(
                hintText: widget.hintText ?? "请输入搜索词",
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                contentPadding: EdgeInsets.only(bottom: height / 3),
                border:InputBorder.none,
                icon: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Icon(
                      Icons.search,
                      size: 18,
                      color: Colors.white,
                    )),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 17,
                    color: Colors.white,
                  ),
                  onPressed: clearKeywords,
                  splashColor: Colors.white,
                )),
            onEditingComplete: () {
              widget.onEditingComplete?.call(controller.text);
            }),
      );
    });
  }
}


