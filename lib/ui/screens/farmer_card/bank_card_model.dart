class BankCardModel {
  String image;

  double balance;
  List<ExpenseModel> expenses;


  BankCardModel({
    required this.image,


    required this.balance,
    this.expenses = const [],
  });
}

class ExpenseModel {
  String image;
  String title;
  String description;
  double amount;


  ExpenseModel({
    required this.image,
    required this.title,
    required this.description,
    required this.amount,
  });
}

final cards = [
  null,
  BankCardModel(
    image: 'assets/images/cultivation.jpg',
    balance: 345.00,
    expenses: [
      ExpenseModel(
          image: 'assets/images/cultivation.jpg',
          title: "Cultivation",
          description: "Plant Cultivation",
          amount: 89)
    ],
  ),
  BankCardModel(
    image: 'assets/images/pests.jpg',
    balance: 123.00,
    expenses: [
      ExpenseModel(
        image: 'assets/images/pests.jpg',
        title: "Pests",
        description: "Pests on Plants",
        amount: 99,
      )
    ],
  ),
  BankCardModel(
    image: 'assets/images/recovery.jpg',
    balance: 789.00,
    expenses: [
      ExpenseModel(
        image: 'assets/images/recovery.jpg',
        title: "Recovery",
        description: "Plants Recovery",
        amount: 186,
      )
    ],
  ), BankCardModel(
    image: 'assets/images/disease.jpg',
    balance: 789.00,
    expenses: [
      ExpenseModel(
        image: 'assets/images/disease.jpg',
        title: "Disease",
        description: "Plants Diseases",
        amount: 99,
      )
    ],
  ), BankCardModel(
    image: 'assets/images/Fertilizer.jpg',
    balance: 789.00,
    expenses: [
      ExpenseModel(
        image: 'assets/images/Fertilizer.jpg',
        title: "Fertilizer",
        description: "Plants Fertilizer",

        amount: 186,
      )
    ],
  ),
];

