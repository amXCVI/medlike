import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/appointments/appointments_cubit.dart';
import 'package:medlike/modules/appointments/feedback/captions_list.dart';
import 'package:medlike/modules/appointments/feedback/feedback_form.dart';
import 'package:medlike/modules/appointments/feedback/visibility_list.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

@RoutePage()
class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key, required this.appointmentId}) : super(key: key);

  final String appointmentId;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late bool isDisabledActionButton = true;
  late int rating = 0;
  final _formKey = GlobalKey<FormState>();

  String _controllerCaption = captionsList[0];
  String _controllerVisible = visibilityList[0];
  String controllerMessage = '';
  String controllerEmail = '';
  late final TextEditingController _controllerMessage =
      TextEditingController(text: '');
  late final TextEditingController _controllerEmail =
      TextEditingController(text: '');
  late String reviewVisibility = '';

  void setRating(int value) {
    setState(() {
      rating = value + 1;
    });
    checkIsDisabledActionButton();
  }

  void setCaption(String value) {
    setState(() {
      _controllerCaption = value;
    });
    checkIsDisabledActionButton();
  }

  void setVisible(String value) {
    setState(() {
      _controllerVisible = value;
    });
    checkIsDisabledActionButton();
  }

  void setEmail(String value) {
    setState(() {
      controllerEmail = value;
    });
    checkIsDisabledActionButton();
  }

  void setMessage(String value) {
    setState(() {
      controllerMessage = value;
    });
    checkIsDisabledActionButton();
  }

  void checkIsDisabledActionButton() {
    if (_controllerCaption.isNotEmpty &&
        _controllerVisible.isNotEmpty &&
        controllerEmail.isNotEmpty &&
        controllerMessage.isNotEmpty &&
        rating > 0) {
      setState(() {
        isDisabledActionButton = false;
      });
    } else {
      setState(() {
        isDisabledActionButton = true;
      });
    }
  }

  void handleSendFeedback(BuildContext context) {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (isDisabledActionButton) {
      return;
    }
    context
        .read<AppointmentsCubit>()
        .saveAppointmentReview(
          appointmentId: widget.appointmentId,
          reviewVisibility: getValueVisibilityByLabel(reviewVisibility),
          caption: _controllerCaption,
          message: _controllerMessage.text,
          email: _controllerEmail.text,
          rate: rating,
        )
        .then((value) {
      context.read<AppointmentsCubit>().setRatingToSelectedAppointment(rating);
      context.router.pop();
    }).catchError((onError) => print(onError));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBarTitle: 'Отзыв',
      actionButton: FloatingActionButton.extended(
        backgroundColor: isDisabledActionButton
            ? AppColors.lightText
            : Theme.of(context).primaryColor,
        onPressed: () => handleSendFeedback(context),
        label: BlocBuilder<AppointmentsCubit, AppointmentsState>(
            builder: (context, state) {
          return state.sendAppointmentReviewStatus ==
                  SendAppointmentReviewStatuses.loading
              ? const CircularLoader()
              : Text(
                  'отправить'.toUpperCase(),
                  style: Theme.of(context).textTheme.titleSmall,
                );
        }),
      ),
      child: SingleChildScrollView(
        child: FeedbackForm(
          ratingValue: rating,
          setRating: setRating,
          formKey: _formKey,
          controllerCaption: _controllerCaption,
          controllerMessage: _controllerMessage,
          controllerEmail: _controllerEmail,
          setCaption: setCaption,
          controllerVisible: _controllerVisible,
          setVisible: setVisible,
          setEmail: setEmail,
          setMessage: setMessage,
        ),
      ),
    );
  }
}
