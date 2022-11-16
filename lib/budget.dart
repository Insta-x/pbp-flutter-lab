class Budget {
  String judul = '';
  int nominal = 0;
  String jenis = 'Pemasukan';

  static List<Budget> budgetList = [];

  Budget(String jud, int nom, String jen) {
    judul = jud;
    nominal = nom;
    jenis = jen;
  }

  static saveBudget(Budget newBudget) {
    budgetList.add(newBudget);
  }
}
