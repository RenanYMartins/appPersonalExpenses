class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;
 
  // Construtor
  Transaction({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}