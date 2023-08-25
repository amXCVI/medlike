class DoctorSubtitleHelper {
  static String getSubtitle({
    required String specialization,
    required String? comment,
    required String? experience,
  }) {
    String subtitle = '';
    try {
      String specialisationText =
          specialization != null && specialization.isNotEmpty
              ? '$specialization, '
              : '';
      String commentText =
          comment != null && comment.isNotEmpty ? '$comment, ' : '';
      String experienceText = experience != null && experience.isNotEmpty
          ? 'стаж с $experienceг.'
          : '';
      subtitle = specialisationText + commentText + experienceText;

      if (subtitle.trim()[subtitle.trim().length - 1] == ',') {
        subtitle = subtitle.trim().substring(0, subtitle.trim().length - 1);
      }
    } catch (err) {}

    return subtitle;
  }
}
