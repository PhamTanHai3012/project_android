import 'package:flutter/material.dart';
import 'package:tanhai_63133878/widgets/wrapper_data.dart';

class MyDropdownButton extends StatefulWidget {
  final List<String> labels;
  final StringWrapper value;
  final Widget Function(String label)? itemBuilder;
  const MyDropdownButton({required this.labels, required this.value,
    required this.itemBuilder, super.key});

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: widget.value.value,
        items: widget.labels.map(
            (lable) => DropdownMenuItem(
              value: lable,
                child: widget.itemBuilder != null ?
                    widget.itemBuilder!(lable) : Text(lable)
            )
        ).toList(),
        onChanged: (value){
          setState(() {
            widget.value.value = value;
          });
        }
    );
  }
}

