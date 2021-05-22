extension DateTimeExtension on DateTime {
  String get now {
    String thu = '';
    if (this.weekday == 1) {
      thu = 'Thứ Hai';
    }
    if (this.weekday == 2) {
      thu = 'Thứ Ba';
    }
    if (this.weekday == 3) {
      thu = 'Thứ Tư';
    }
    if (this.weekday == 4) {
      thu = 'Thứ Năm';
    }
    if (this.weekday == 5) {
      thu = 'Thứ Sáu';
    }
    if (this.weekday == 6) {
      thu = 'Thứ Bảy';
    }
    if (this.weekday == 7) {
      thu = 'Chủ Nhật';
    }
    if (this.day == DateTime.now().day &&
        this.month == DateTime.now().month &&
        this.year == DateTime.now().year) {
      return 'Hôm Nay';
    } else if (this.day == DateTime.now().day + 1 &&
        this.month == DateTime.now().month &&
        this.year == DateTime.now().year) {
      return 'Ngày Mai';
    } else if (this.day == DateTime.now().day + 2 &&
        this.month == DateTime.now().month &&
        this.year == DateTime.now().year) {
      return 'Ngày Kia';
    } else {
      return thu + ',ngày ${this.day} tháng ${this.month}, ${this.year}';
    }
  }
}
