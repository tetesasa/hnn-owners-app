enum Permission {
  viewOwnBookings('view_own_bookings'),
  createBooking('create_booking'),
  cancelBooking('cancel_booking'),
  editProfile('edit_profile'),
  uploadPhotos('upload_photos'),
  sendMessages('send_messages'),
  viewReports('view_reports');

  const Permission(this.value);
  final String value;

  static Permission fromString(String value) {
    return Permission.values.firstWhere(
      (permission) => permission.value == value,
      orElse: () => Permission.viewOwnBookings,
    );
  }

  @override
  String toString() => value;
}
