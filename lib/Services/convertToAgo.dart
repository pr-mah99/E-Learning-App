String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  if(diff.inDays >= 1){
    return ' منذُ ${diff.inDays} يوم ';
  } else if(diff.inHours >= 1){
    return ' منذُ ${diff.inHours} ساعة ';
  } else if(diff.inMinutes >= 1){
    return ' منذُ ${diff.inMinutes} دقيقة ';
  } else if (diff.inSeconds >= 1){
    return ' منذُ ${diff.inSeconds} ثواني ';
  } else {
    return 'منذُ لحظات';
  }
}