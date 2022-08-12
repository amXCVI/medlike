import 'package:flutter/material.dart';

class DiaryAddForm extends StatefulWidget {
  const DiaryAddForm({
    Key? key,
    required this.title,
    this.secondTitle,
    required this.measureItem
  }) : super(key: key);

  final String title;
  final String? secondTitle;
  final String measureItem;

  @override
  State<DiaryAddForm> createState() => _DiaryAddFormState();
}

class _DiaryAddFormState extends State<DiaryAddForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller = TextEditingController();
  late final TextEditingController _dateController = TextEditingController();
  late final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormField(
            labelText: widget.title, 
            controller: _controller, 
            onChange: () {}
          ),
          if (widget.secondTitle != null) FormField(
            labelText: widget.secondTitle!, 
            controller: _controller, 
            onChange: () {}
          ),
          FormField(
            labelText: 'Дата', 
            controller: _dateController, 
            onChange: () {}
          ),
          FormField(
            labelText: 'Время', 
            controller: _timeController, 
            onChange: () {}
          ),
        ],
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.onChange
  }) : super(key: key);

  final String labelText;
  final TextEditingController controller;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Введите пароль', style: Theme.of(context).textTheme.labelMedium),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: TextField(
            controller: controller,
            onChanged: (text) => onChange(text),
            autofocus: false,
            enableSuggestions: false,
            autocorrect: false,
            textInputAction: TextInputAction.done,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
