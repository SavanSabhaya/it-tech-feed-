import 'package:intl/intl.dart';

String timeAgo(DateTime dateTime) {
  final difference = DateTime.now().difference(dateTime);
  if (difference.inDays >= 365) {
    final years = (difference.inDays / 365).floor();
    return '${years}y ago';
  }
  if (difference.inDays >= 30) {
    final months = (difference.inDays / 30).floor();
    return '${months}mo ago';
  }
  if (difference.inDays >= 1) return '${difference.inDays}d ago';
  if (difference.inHours >= 1) return '${difference.inHours}h ago';
  if (difference.inMinutes >= 1) return '${difference.inMinutes}m ago';
  return 'just now';
}

String formatReadMinutes(int? minutes) {
  if (minutes == null || minutes <= 0) return '';
  return '${minutes} min read';
}

String formatDate(DateTime date) => DateFormat.yMMMd().format(date);

