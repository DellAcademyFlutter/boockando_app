import 'db_consts.dart';

/// Queries of Database.

// table creation queries
const SCRIPT_CREATE_TABLE_USER_SQL =
    "CREATE TABLE IF NOT EXISTS $TABLE_USER_NAME ("
    "$TABLE_USER_ATT_ID INTEGER NOT NULL,"
    "$TABLE_USER_ATT_NAME TEXT NOT NULL, "
    "$TABLE_USER_ATT_PASSWORD TEXT NOT NULL, "
    "$TABLE_USER_ATT_EMAIL TEXT NOT NULL,"
    "PRIMARY KEY($TABLE_USER_ATT_ID))";

const SCRIPT_CREATE_TABLE_BOOK_SQL =
    "CREATE TABLE IF NOT EXISTS $TABLE_BOOK_NAME ("
    "$TABLE_BOOK_ATT_ID INTEGER NOT NULL,"
    "$TABLE_BOOK_ATT_TITLE TEXT NOT NULL, "
    "$TABLE_BOOK_ATT_ISBN TEXT,"
    "$TABLE_BOOK_ATT_PRICE REAL NOT NULL,"
    "$TABLE_BOOK_ATT_ABOUT TEXT,"
    "$TABLE_BOOK_ATT_CATEGORY TEXT NOT NULL,"
    "$TABLE_BOOK_ATT_IMAGE TEXT,"
    "PRIMARY KEY($TABLE_BOOK_ATT_ID))";

const SCRIPT_CREATE_TABLE_BASKET_SQL =
    "CREATE TABLE IF NOT EXISTS $TABLE_BASKET_NAME ("
    "$TABLE_BASKET_ATT_ID INTEGER NOT NULL,"
    "$TABLE_BASKET_ATT_VALUE REAL NOT NULL,"
    "PRIMARY KEY($TABLE_BASKET_ATT_ID))";

const SCRIPT_CREATE_TABLE_BASKET_BOOKS_SQL =
    "CREATE TABLE IF NOT EXISTS $TABLE_BASKET_BOOKS_NAME ("
    "$TABLE_BASKET_BOOKS_ATT_ID_BASKET INTEGER NOT NULL,"
    "$TABLE_BASKET_BOOKS_ATT_ID_BOOK INTEGER NOT NULL,"
    "$TABLE_BASKET_BOOKS_ATT_ID_USER INTEGER NOT NULL,"
    "$TABLE_BASKET_BOOKS_ATT_BOOK_PRICE REAL NOT NULL,"
    "$TABLE_BASKET_BOOKS_ATT_BOOK_QTD INTEGER NOT NULL,"
    "FOREIGN KEY($TABLE_BASKET_BOOKS_ATT_ID_BASKET) REFERENCES $TABLE_BASKET_NAME($TABLE_BASKET_ATT_ID),"
    "FOREIGN KEY($TABLE_BASKET_BOOKS_ATT_ID_BOOK) REFERENCES $TABLE_BOOK_NAME($TABLE_BOOK_ATT_ID),"
    "FOREIGN KEY($TABLE_BASKET_BOOKS_ATT_ID_USER) REFERENCES $TABLE_USER_NAME($TABLE_USER_ATT_ID))";

const SCRIPT_CREATE_TABLE_PURCHASE_SQL =
    "CREATE TABLE IF NOT EXISTS $TABLE_PURCHASE_NAME ("
    "$TABLE_PURCHASE_ATT_BASKET_ID INTEGER NOT NULL,"
    "$TABLE_PURCHASE_ATT_USER_ID INTEGER NOT NULL,"
    "$TABLE_PURCHASE_ATT_DAY TEXT,"
    "$TABLE_PURCHASE_ATT_MONTH TEXT,"
    "$TABLE_PURCHASE_ATT_IS_DELETED TEXT NOT NULL,"
    "FOREIGN KEY($TABLE_PURCHASE_ATT_BASKET_ID) REFERENCES $TABLE_BASKET_NAME($TABLE_BASKET_ATT_ID),"
    "FOREIGN KEY($TABLE_PURCHASE_ATT_USER_ID) REFERENCES $TABLE_USER_NAME($TABLE_USER_ATT_ID))";