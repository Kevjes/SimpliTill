// @dart=2.9

import 'package:flutter/material.dart';
import 'package:simpli_till_test/app/configs/configs.dart';
import 'package:simpli_till_test/app/models/my_item_model.dart';

class BasketWidget extends StatefulWidget {
  final MyItemModel item;
  final Function(int) onChange;
  const BasketWidget({Key key, this.item, this.onChange}) : super(key: key);

  @override
  _BasketWidgetState createState() => _BasketWidgetState();
}

class _BasketWidgetState extends State<BasketWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  if (widget.item.qte > 1) {
                    widget.item.qte--;
                    widget.onChange(widget.item.qte);
                    setState(() {});
                  }
                },
                icon: Icon(Icons.remove, color: Config.colors.greyTextColor2)),
            Text(
              widget.item.qte.toString(),
              style: TextStyle(color: Config.colors.greyTextColor),
            ),
            IconButton(
                onPressed: () {
                  widget.item.qte++;
                  widget.onChange(widget.item.qte);
                  setState(() {});
                },
                icon: Icon(Icons.add, color: Config.colors.greyTextColor2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(color: Config.colors.greyTextColor),
                ),
                Text(widget.item.price.toString(),
                    style: TextStyle(
                        color: Config.colors.greyTextColor2, fontSize: 13)),
              ],
            ),
            Text(
              (widget.item.price * widget.item.qte).toString(),
              style:
                  TextStyle(color: Config.colors.greyTextColor, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
