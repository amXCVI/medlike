class DoctorSubtitleHelper {
  static String getSubtitle({
    required String specialization,
    required String? comment,
    required String? experience,
  }) {
    String specialisationText =
        specialization != null && specialization.isNotEmpty
            ? '$specialization, '
            : '';
    String commentText =
        comment != null && comment.isNotEmpty ? '$comment, ' : '';
    String experienceText = experience != null && experience.isNotEmpty
        ? 'Стаж - $experience лет'
        : '';
    String subtitle = specialisationText + commentText + experienceText;

    if (subtitle.trim()[subtitle.trim().length - 1] == ',') {
      subtitle = subtitle.trim().substring(0, subtitle.trim().length - 1);
    }

    return subtitle;
  }
}
