String calculateDays(String deadline) {
  final date1 = DateTime.parse(deadline);
  final date2 = DateTime.now();
  return date1.difference(date2).inDays.toString();
}

String calculateYears(String date) {
  final date1 = DateTime.now();
  final date2 = DateTime.parse(date);
  int totalDays = date1.difference(date2).inDays;
  int years = totalDays ~/ 365;
  return years.toString();
}

search({required String query, required List list}) {
  int i = 0;
  return list.where((job) {
    final jobTitle = list[i].name.toLowerCase();
    final searchTitle = query.toLowerCase();
    i++;
    return jobTitle.contains(searchTitle);
  }).toList();
}
