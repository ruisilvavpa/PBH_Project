class ChangePassword {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePassword(this.oldPassword, this.newPassword, this.confirmPassword);

  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
        'confirmPassword': confirmPassword
      };
}
