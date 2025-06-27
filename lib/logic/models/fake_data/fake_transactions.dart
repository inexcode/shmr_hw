import 'package:decimal/decimal.dart';
import 'package:shmr_hw/logic/models/transaction.dart';

final fakeTransactions = [
  // Incomes
  Transaction(
    id: 1,
    createdAt: DateTime.now().subtract(const Duration(days: 28)),
    updatedAt: DateTime.now().subtract(const Duration(days: 28)),
    transactionDate: DateTime.now().subtract(const Duration(days: 28)),
    amount: Decimal.parse('65000'),
    categoryId: 1, // Зарплата
    comment: 'Зарплата за май',
    accountId: 1,
    isIncome: true,
  ),
  Transaction(
    id: 2,
    createdAt: DateTime.now().subtract(const Duration(days: 22)),
    updatedAt: DateTime.now().subtract(const Duration(days: 22)),
    transactionDate: DateTime.now().subtract(const Duration(days: 22)),
    amount: Decimal.parse('12000'),
    categoryId: 2, // Фриланс
    comment: 'Проект для клиента',
    accountId: 1,
    isIncome: true,
  ),
  Transaction(
    id: 3,
    createdAt: DateTime.now().subtract(const Duration(days: 18)),
    updatedAt: DateTime.now().subtract(const Duration(days: 18)),
    transactionDate: DateTime.now().subtract(const Duration(days: 18)),
    amount: Decimal.parse('5000'),
    categoryId: 3, // Подарки (доход)
    comment: 'Деньги на день рождения',
    accountId: 1,
    isIncome: true,
  ),
  Transaction(
    id: 4,
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
    updatedAt: DateTime.now().subtract(const Duration(days: 15)),
    transactionDate: DateTime.now().subtract(const Duration(days: 15)),
    amount: Decimal.parse('800'),
    categoryId: 4, // Проценты по вкладам
    comment: 'Проценты по вкладу',
    accountId: 1,
    isIncome: true,
  ),
  Transaction(
    id: 5,
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
    updatedAt: DateTime.now().subtract(const Duration(days: 10)),
    transactionDate: DateTime.now().subtract(const Duration(days: 10)),
    amount: Decimal.parse('3000'),
    categoryId: 5, // Возврат долга
    comment: 'Вернули долг',
    accountId: 1,
    isIncome: true,
  ),
  Transaction(
    id: 17,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    transactionDate: DateTime.now(),
    amount: Decimal.parse('8000'),
    categoryId: 2, // Фриланс
    comment: 'Оплата за срочный заказ',
    accountId: 1,
    isIncome: true,
  ),
  // Expenses
  Transaction(
    id: 6,
    createdAt: DateTime.now().subtract(const Duration(days: 27)),
    updatedAt: DateTime.now().subtract(const Duration(days: 27)),
    transactionDate: DateTime.now().subtract(const Duration(days: 27)),
    amount: Decimal.parse('25000'),
    categoryId: 7, // Жильё
    comment: 'Аренда квартиры',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 7,
    createdAt: DateTime.now().subtract(const Duration(days: 26)),
    updatedAt: DateTime.now().subtract(const Duration(days: 26)),
    transactionDate: DateTime.now().subtract(const Duration(days: 26)),
    amount: Decimal.parse('4200'),
    categoryId: 8, // Продукты
    comment: 'Покупка продуктов в супермаркете',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 8,
    createdAt: DateTime.now().subtract(const Duration(days: 25)),
    updatedAt: DateTime.now().subtract(const Duration(days: 25)),
    transactionDate: DateTime.now().subtract(const Duration(days: 25)),
    amount: Decimal.parse('1200'),
    categoryId: 9, // Транспорт
    comment: 'Проездной на месяц',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 9,
    createdAt: DateTime.now().subtract(const Duration(days: 23)),
    updatedAt: DateTime.now().subtract(const Duration(days: 23)),
    transactionDate: DateTime.now().subtract(const Duration(days: 23)),
    amount: Decimal.parse('1800'),
    categoryId: 10, // Развлечения
    comment: 'Кино и боулинг',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 10,
    createdAt: DateTime.now().subtract(const Duration(days: 21)),
    updatedAt: DateTime.now().subtract(const Duration(days: 21)),
    transactionDate: DateTime.now().subtract(const Duration(days: 21)),
    amount: Decimal.parse('2300'),
    categoryId: 11, // Рестораны
    comment: 'Ужин в ресторане',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 11,
    createdAt: DateTime.now().subtract(const Duration(days: 19)),
    updatedAt: DateTime.now().subtract(const Duration(days: 19)),
    transactionDate: DateTime.now().subtract(const Duration(days: 19)),
    amount: Decimal.parse('3500'),
    categoryId: 12, // Одежда
    comment: 'Покупка летней одежды',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 12,
    createdAt: DateTime.now().subtract(const Duration(days: 17)),
    updatedAt: DateTime.now().subtract(const Duration(days: 17)),
    transactionDate: DateTime.now().subtract(const Duration(days: 17)),
    amount: Decimal.parse('900'),
    categoryId: 13, // Здоровье
    comment: 'Лекарства и аптека',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 13,
    createdAt: DateTime.now().subtract(const Duration(days: 14)),
    updatedAt: DateTime.now().subtract(const Duration(days: 14)),
    transactionDate: DateTime.now().subtract(const Duration(days: 14)),
    amount: Decimal.parse('2100'),
    categoryId: 14, // Коммунальные услуги
    comment: 'Оплата коммунальных услуг',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 14,
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
    updatedAt: DateTime.now().subtract(const Duration(days: 12)),
    transactionDate: DateTime.now().subtract(const Duration(days: 12)),
    amount: Decimal.parse('1500'),
    categoryId: 18, // Подписки
    comment: 'Годовая подписка на музыку',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 15,
    createdAt: DateTime.now().subtract(const Duration(days: 8)),
    updatedAt: DateTime.now().subtract(const Duration(days: 8)),
    transactionDate: DateTime.now().subtract(const Duration(days: 8)),
    amount: Decimal.parse('7000'),
    categoryId: 17, // Путешествия
    comment: 'Билеты на поезд',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 16,
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    updatedAt: DateTime.now().subtract(const Duration(days: 5)),
    transactionDate: DateTime.now().subtract(const Duration(days: 5)),
    amount: Decimal.parse('1200'),
    categoryId: 21, // Спорт
    comment: 'Абонемент в спортзал',
    accountId: 1,
    isIncome: false,
  ),
  Transaction(
    id: 18,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    transactionDate: DateTime.now(),
    amount: Decimal.parse('950'),
    categoryId: 8, // Продукты
    comment: 'Покупка продуктов на ужин',
    accountId: 1,
    isIncome: false,
  ),
];
