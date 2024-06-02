import 'package:ez_validator_dart/src/validator/ez_validator_builder.dart';

import '../regex_list.dart';

extension StringValidatorExtensions<T> on EzValidator<T> {
  /// match the value with [reg]
  /// [message] is the message to return if the validation fails
  EzValidator<T> matches(RegExp reg, [String? message]) =>
      addValidation((v, [_]) {
        if (v is String) {
          return reg.hasMatch(v)
              ? null
              : message ??
                  EzValidator.globalLocale.matches(reg.pattern, v, label);
        }
        return 'Invalid type for pattern matching';
      });

  /// Checks if the value is an email address
  /// [message] is the message to return if the validation fails
  EzValidator<T> email([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return emailRegExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.email(v, label);
        }
        return 'Invalid type for email validation';
      });

  /// Checks if the value is a phone number
  /// [message] is the message to return if the validation fails
  EzValidator<T> phone([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return phoneRegExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.phoneNumber(v, label);
        }
        return 'Invalid type for phone validation';
      });

  /// Checks if the value is an ipv4
  /// [message] is the message to return if the validation fails
  EzValidator<T> ip([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return ipv4RegExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.ip(v, label);
        }
        return 'Invalid type for ip validation';
      });

  /// Checks if the value is an ipv6 address
  /// [message] is the message to return if the validation fails
  EzValidator<T> ipv6([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return ipv6RegExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.ipv6(v, label);
        }
        return 'Invalid type for ipv6 validation';
      });

  /// Checks if the value is a url
  /// [message] is the message to return if the validation fails
  EzValidator<T> url([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return urlRegExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.url(v, label);
        }
        return 'Invalid type for url validation';
      });

  /// Checks if the value is a UUID
  /// [message] is the message to return if the validation fails
  EzValidator<T> uuid([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return uuidExp.hasMatch(v)
              ? null
              : message ?? EzValidator.globalLocale.uuid(v, label);
        }
        return 'Invalid type for uuid validation';
      });

  /// Checks if the value is a lowercase
  /// [message] is the message to return if the validation fails
  EzValidator<T> lowerCase([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return v == v.toLowerCase()
              ? null
              : message ?? EzValidator.globalLocale.lowerCase(v, label);
        }
        return 'Invalid type for lowerCase validation';
      });

  /// Checks if the value is an uppercase
  /// [message] is the message to return if the validation fails
  EzValidator<T> upperCase([String? message]) => addValidation((v, [_]) {
        if (v is String) {
          return v == v.toUpperCase()
              ? null
              : message ?? EzValidator.globalLocale.upperCase(v, label);
        }
        return 'Invalid type for lowerCase validation';
      });
}
