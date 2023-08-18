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
  const FeedbackPage({
    Key? key,
    required this.appointmentId,
    required this.rating,
    required this.controllerCaption,
    required this.controllerVisible,
    required this.controllerMessage,
    required this.controllerEmail,
  }) : super(key: key);

  final String appointmentId;

  final int rating;
  final String controllerCaption;
  final String controllerVisible;
  final String controllerMessage;
  final String controllerEmail;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  late bool isDisabledActionButton = true;
  late int rating = 0;
  final _formKey = GlobalKey<FormState>();

  late String _controllerCaption = captionsList[0];
  late String _controllerVisible = visibilityList[0];
  late String controllerMessage = '';
  late String controllerEmail = '';
  late final TextEditingController _controllerMessage =
      TextEditingController(text: '');
  late final TextEditingController _controllerEmail =
      TextEditingController(text: '');
  late String reviewVisibility = '';

  @override
  void initState() {
    super.initState();
  }

  void setDataToState() {
    setState(() {
      _controllerCaption = widget.controllerCaption.isNotEmpty
          ? widget.controllerCaption
          : captionsList[0];
      _controllerVisible = widget.controllerVisible.isNotEmpty
          ? widget.controllerVisible
          : visibilityList[0];
      _controllerMessage.text = widget.controllerMessage ?? '';
      _controllerEmail.text = widget.controllerEmail ?? '';
      rating = widget.rating ?? 0;

      controllerMessage = widget.controllerMessage ?? '';
      controllerEmail = widget.controllerEmail ?? '';
    });
  }

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
    }).catchError((onError) {
      print(onError);
      context.read<AppointmentsCubit>().setRatingToSelectedAppointment(rating);
      context.router.pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => setDataToState());
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
