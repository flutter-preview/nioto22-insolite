import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

//region Title
class TitleBold extends StatelessWidget {
  final String text;

  const TitleBold(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        text,
        style: const TextStyle(
          fontSize: 34,
          color: Colors.white,
          fontWeight: FontWeight.bold,

        ),
      ),
    );
  }
}
//endregion

//region Text
class TitleRegular extends StatelessWidget {
  final String text;

  const TitleRegular(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
//endregion

//region EditText
class EditText extends StatefulWidget {
  final String hint;
  final Function(String) onTextChanged;

  const EditText({Key? key, required this.hint, required this.onTextChanged}) : super(key: key);

  @override
  _EditTextState createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onTextChanged(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: const TextStyle(fontSize: 17, color: Colors.black),
    );
  }
}
//endregion

//region TextButton
class TextButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const TextButtonCustom({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.blue,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
//endregion

//region Button
class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const MyButton({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
//endregion

//region MyNumberPicker
class MyNumberPicker extends StatefulWidget {
  final ValueChanged<int> onValueChanged;

  const MyNumberPicker({Key? key, required this.onValueChanged}) : super(key: key);

  @override
  _NumberPicker createState() => _NumberPicker();
}

class _NumberPicker extends State<MyNumberPicker> {
  int _currentHorizontalIntValue = 2;

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      value: _currentHorizontalIntValue,
      minValue: 2,
      maxValue: 15,
      step: 1,
      itemHeight: 100,
      axis: Axis.horizontal,
      onChanged: (value) => setState(() {
        _currentHorizontalIntValue = value;
        widget.onValueChanged(value);
      }),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white),
      ),
    );
  }
}
//endregion
