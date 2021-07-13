// @dart=2.9
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/models/category_model.dart';

class CategoryWidgetBuilder extends StatefulWidget {
  final List<CategoryModel> categories;
  final Function onChange;
  final Axis scrollDirection;
  const CategoryWidgetBuilder(
      {Key key,
      this.categories,
      this.onChange,
      this.scrollDirection = Axis.vertical})
      : super(key: key);

  @override
  _CategoryWidgetBuilderState createState() => _CategoryWidgetBuilderState();
}

class _CategoryWidgetBuilderState extends State<CategoryWidgetBuilder> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selected = List.generate(widget.categories.length, (index) => false);
    if (index == null)
      index =
          List.generate(widget.categories.length, (index) => random.nextInt(5));
    selected[0] = true;
  }

  List<bool> selected;
  List<int> index;
  List colors = [
    Config.colors.red,
    Config.colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green
  ];
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: widget.scrollDirection,
        itemCount: widget.categories.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                  border: selected[i]
                      ? widget.scrollDirection == Axis.vertical
                          ? Border(
                              right: BorderSide(
                                  color: Config.colors.blue, width: 3))
                          : Border(
                              bottom: BorderSide(
                                  color: Config.colors.blue, width: 3))
                      : null),
              child: InkWell(
                onTap: () {
                  for (var i = 0; i < selected.length; i++) {
                    selected[i] = false;
                  }
                  selected[i] = true;
                  setState(() {});
                  widget.onChange(i);
                },
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: colors[random.nextInt(5)],
                          borderRadius: BorderRadius.circular(5),
                          image: this.widget.categories[i].image != null
                              ? DecorationImage(
                                  image: AssetImage(
                                      this.widget.categories[i].image),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                        child: this.widget.categories[i].image != null
                            ? null
                            : Center(
                                child: Text(
                                  this.widget.categories[i].title[0],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ),
                              ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        this.widget.categories[i].title,
                        style: TextStyle(
                            color: selected[i]
                                ? Config.colors.blue
                                : Config.colors.greyTextColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
