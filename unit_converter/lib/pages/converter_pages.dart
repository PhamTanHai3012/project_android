import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/models/ApiService.dart';

class ConverterScreen extends StatefulWidget {
  String name;
  List<Unit> units;

  ConverterScreen({required this.name, required this.units});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  late Unit _fromValue;
  late Unit _toValue;
  late double _inputValue;
  String _convertedValue = '';
  late List<DropdownMenuItem> _unitMenuItems;
  bool _showValidationError = false;

  @override
  void initState() {
    super.initState();
    _createDropdownMenuItems();
    _setDefaults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade50,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.deepOrange.shade50,
        title: Text(widget.name,style: TextStyle(color: Colors.black),),
      ),
      body: Column(
        children: [
          buildInput(),
          buildArrows(),
          buildOutput(),
        ],
      )
    );
  }

  //Đặt kiểu giá trị mặc định cho giá trị ban đầu và giá trị chuyển đổi
  // là kiểu giá trị đầu tiên [0] và thứ nhất [1]
  void _setDefaults() {
    setState(() {
      _fromValue = widget.units[0];
      _toValue = widget.units[1];
    });
    _updateConversion();
  }

  // Loại bỏ số 0 và dấu . thập phân dư thừa 5.500 -> 5.5, 10.0 -> 10
  String _format(double conversion) {
    var outputNum = conversion.toStringAsPrecision(7);
    if (outputNum.contains('.') && outputNum.endsWith('0')) {
      var i = outputNum.length - 1;
      while (outputNum[i] == '0') {
        i -= 1;
      }
      outputNum = outputNum.substring(0, i + 1);
    }
    if (outputNum.endsWith('.')) {
      return outputNum.substring(0, outputNum.length - 1);
    }
    return outputNum;
  }

  void _updateConversion() async {
    setState(() {
      _convertedValue = _format(
          _inputValue * (_toValue.conversion / _fromValue.conversion));
    });
  }

  void _updateInputValue(String input) {
    setState(() {
      try {
          final inputDouble = double.parse(input);
          _showValidationError = false;
          _inputValue = inputDouble;
          _updateConversion();
        } on Exception catch (e) {
          print('Error: $e');
          _showValidationError = true;
        }
    });
  }

  Unit _getUnit(String unitName) {
    return widget.units.firstWhere(
      (Unit unit) {
        return unit.name == unitName;
      }
    );
  }

  void _updateFromConversion(dynamic unitName) {
    setState(() {
      _fromValue = _getUnit(unitName);
    });
    _updateConversion();
  }

  void _updateToConversion(dynamic unitName) {
    setState(() {
      _toValue = _getUnit(unitName);
    });
    _updateConversion();
  }

  void InputOutput() {
    setState(() {
      final temp = _fromValue;
      _fromValue = _toValue;
      _toValue = temp;
      _updateConversion();
    });
  }

  // Tạo danh sách DropdownMenuItem để hiển thị danh sách các kiểu đơn vị
  void _createDropdownMenuItems() {
    var newItems = <DropdownMenuItem>[];
    for (var unit in widget.units) {
      newItems.add(DropdownMenuItem(
        value: unit.name,
        child: Container(
          child: Text(
            unit.name,
            softWrap: true,
          ),
        ),
      ));
    }
    setState(() {
      _unitMenuItems = newItems;
    });
  }

  Widget _createDropdown(String currentValue, ValueChanged<dynamic> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: DropdownButtonFormField(
        decoration: InputDecoration(border: OutlineInputBorder()),
        value: currentValue,
        items: _unitMenuItems,
        onChanged: onChanged,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Padding buildInput() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              errorText: _showValidationError ? "Invalid number entered" : null,
              labelText: "Input",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              _updateInputValue(value);
            },
          ),
          _createDropdown(_fromValue.name, _updateFromConversion)
        ],
      ),
    );
  }

  Widget buildArrows() {
    return GestureDetector(
      onTap: InputOutput,
      child: RotatedBox(
        quarterTurns: 1,
        child: Icon(
          Icons.compare_arrows,
          size: 40.0,
        ),
      ),
    );
  }

  Padding buildOutput() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: TextEditingController()..text = _convertedValue,
            decoration: InputDecoration(
              labelText: "Output",
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          _createDropdown(_toValue.name, _updateToConversion),
        ],
      ),
    );
  }
}
