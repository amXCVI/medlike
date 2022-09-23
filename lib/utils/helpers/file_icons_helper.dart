class FileIconsHelper {
  static String getCustomFileIcon(String fileType) {
    switch (fileType.toLowerCase()) {
      case 'jpeg':
        return ('assets/icons/medcard/ic_img_outline.svg');
      case 'doc':
        return ('assets/icons/medcard/ic_doc_outline.svg');
      case 'docx':
        return ('assets/icons/medcard/ic_docx_outline.svg');
      case 'pdf':
        return ('assets/icons/medcard/ic_pdf_outline.svg');
      case 'rtf':
        return ('assets/icons/medcard/ic_rtf_outline.svg');
      case 'plain':
        return ('assets/icons/medcard/ic_txt_outline.svg');
      default:
        return ('assets/icons/medcard/ic_doc_outline.svg');
    }
  }

  static const List<String> notImageFileTypesList = [
    'doc',
    'docx',
    'pdf',
    'rtf',
    'plain',
  ];
}
