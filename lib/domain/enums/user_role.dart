enum UserRole {
  owner('owner'),
  staff('staff');

  const UserRole(this.value);
  final String value;

  static UserRole fromString(String value) {
    return UserRole.values.firstWhere(
      (role) => role.value == value,
      orElse: () => UserRole.owner,
    );
  }

  @override
  String toString() => value;
}
