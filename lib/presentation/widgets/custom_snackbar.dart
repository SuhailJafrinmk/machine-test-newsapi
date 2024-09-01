import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Creates a [SnackBar] with a customizable appearance based on whether it represents an error or a success message.
///
/// The [SnackBar] will display a message with a background color that varies depending on the `isError` flag.
/// If `isError` is true, the background color will be [CupertinoColors.destructiveRed]; otherwise, it will be [Colors.teal].
/// 
/// The [SnackBar] has a duration of 3 seconds, uses floating behavior, and has rounded corners.
///
/// * [context]: The build context used to retrieve the [SnackBar]'s properties.
/// * [isError]: A boolean indicating whether the [SnackBar] represents an error message. If true, the background color will be red.
/// * [message]: The text content to display inside the [SnackBar].
///
/// Returns a [SnackBar] with the specified properties.
SnackBar customSnackbar(BuildContext context, bool isError, String message) {
  return SnackBar(
    content: Text(
      message,
    ),
    backgroundColor: isError ? CupertinoColors.destructiveRed : Colors.teal,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
