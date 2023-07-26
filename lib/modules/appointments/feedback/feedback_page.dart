import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:medlike/modules/appointments/feedback/feedback_form.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.appointmentId}) : super(key: key);

  final String appointmentId;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late bool isDisabledActionButton = false;
  late int rating = 0;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerCaption = TextEditingController();
  late final TextEditingController _controllerMessage =
      TextEditingController(text: '');
  late final TextEditingController _controllerEmail =
      TextEditingController(text: '');
  late String reviewVisibility = '';

  void setRating(int value) {
    setState(() {
      rating = value;
    });
  }

  void setCaption(String value) {
    setState(() {
      _controllerCaption.text = value;
    });
  }

  void handleSendFeedback() {}

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Отзыв',
      actionButton: FloatingActionButton.extended(
        onPressed: handleSendFeedback,
        label: Text(
          'отправить'.toUpperCase(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      child: FeedbackForm(
        ratingValue: rating,
        setRating: setRating,
        formKey: _formKey,
        controllerCaption: _controllerCaption,
        controllerMessage: _controllerMessage,
        controllerEmail: _controllerEmail,
        setCaption: setCaption,
      ),
    );
  }
}
