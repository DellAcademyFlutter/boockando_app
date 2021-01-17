import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:boockando_app/app/data/local/book_dao.dart';
import 'package:boockando_app/app/data/online/book_online_dao.dart';
import 'package:boockando_app/app/models/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBookController extends ChangeNotifier {
  final bookOnlineDao = Modular.get<BookOnlineDao>();
  final bookDao = Modular.get<BookDao>();
  bool hasInternet = true;
  List<Book> books;

  initializeBooksfromJson() async {
    final appController = Modular.get<AppBookController>();
    await bookOnlineDao
        .getBooks()
        .then((value) => appController.setBooks(value));
    await bookDao.dropAndCreateBooks();
    addBooksOnDb();
  }

  initializeBooksfromLocal() async {
    final appController = Modular.get<AppBookController>();
    await bookDao.getBooks().then((value) => appController.setBooks(value));
  }

  setBooks(List<Book> books) {
    this.books = books;

    notifyListeners();
  }

  updateBook(Book book) async {
    await bookOnlineDao.putBook(book: book);
    books[getBookIndexById(bookId: book.id)].setValues(inputBook: book);

    notifyListeners();
  }

  getBookIndexById({int bookId}) {
    for (var i = 0; i < books.length; i++) {
      if (books[i].id == bookId) {
        return i;
      }
    }
    return -1;
  }

  Book getBookById(int bookId) {
    for (var i = 0; i < books.length; i++) {
      if (books[i].id == bookId) {
        return books[i];
      }
    }
    return null;
  }

  addBook(Book book) async {
    await bookOnlineDao.postBook(book: book).then((value) => book.id = value);
    books.add(book);

    notifyListeners();
  }

  deleteBook(Book book) async {
    await bookOnlineDao.RemoveBook(idBook: book.id);
    books.remove(book);

    notifyListeners();
  }

  addBooksOnDb() async {
    for (var i = 0; i < books.length; i++) {
      //Convert ImageUrl to Image64 to add on local DB
      final response = await http.get(
        books[i].bookImage,
      );
      final base64 = base64Encode(response.bodyBytes);
      final book = Book();
      book.setValues(inputBook: books[i]);
      book.bookImage = base64;
      await bookDao.insertBook(book);
    }
  }
}
