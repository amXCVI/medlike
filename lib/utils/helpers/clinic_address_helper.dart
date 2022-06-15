class ClinicAddressHelper {
  static List<String> clinicAddressSplitter(String address) {
    if (address.isEmpty) return [];
    List<String> addressArray = address.split(', ');
    return addressArray;
  }

  static String getShortAddress(String address) {
    List<String> addressArray = ClinicAddressHelper.clinicAddressSplitter(address);
    if (addressArray.isEmpty) return '';
    addressArray.removeAt(0);
    addressArray.removeAt(0);
    addressArray.removeAt(0);
    String shortAddress = addressArray.join(', ');
    return shortAddress;
  }
}
