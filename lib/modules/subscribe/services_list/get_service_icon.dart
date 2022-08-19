String getServiceIconById(String serviceId) {
  switch (serviceId.toString()) {
    case '6':
      return 'assets/icons/services/telemed.svg';
    case '0':
      return 'assets/icons/services/consultation.svg';
    case '1':
      return 'assets/icons/services/laboratory.svg';
    case '3':
      return 'assets/icons/services/mrt.svg';
    case '4':
      return 'assets/icons/services/uzi.svg';
    case '7':
      return 'assets/icons/services/rentgen.svg';
    case '2':
      return 'assets/icons/services/procedures.svg';
    case '8':
      return 'assets/icons/services/other.svg';
    case '9':
      return 'assets/icons/services/endoscopy.svg';
    case '10':
      return 'assets/icons/services/dantist.svg';
    case '11':
      return 'assets/icons/services/cosmetology.svg';
    case '12':
      return 'assets/icons/services/gynecology.svg';
    case '13':
      return 'assets/icons/services/lfk.svg';
    case '14':
      return 'assets/icons/services/computer_tomography.svg';
    case '15':
      return 'assets/icons/services/functional.svg';

    default:
      return 'assets/icons/services/other.svg';
  }
}
