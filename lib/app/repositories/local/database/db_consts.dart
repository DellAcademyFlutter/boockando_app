/// Constants of Database.

// Database Attributes
const DATABASE_NAME = "boockando.db";

// Table Names
const TABLE_USER_NAME = "user";
const TABLE_BOOK_NAME = "book";
const TABLE_BASKET_NAME = "basket";
const TABLE_BASKET_BOOKS_NAME = "basket_books";
const TABLE_PURCHASE_NAME = "purchase";

// Table attributes
//User
const TABLE_USER_ATT_ID = "id"; //PK
const TABLE_USER_ATT_NAME = "name";
const TABLE_USER_ATT_EMAIL = "email";
const TABLE_USER_ATT_PASSWORD = "password";

//Book
const TABLE_BOOK_ATT_ID = "id"; //PK
const TABLE_BOOK_ATT_TITLE = "title";
const TABLE_BOOK_ATT_ABOUT = "about";
const TABLE_BOOK_ATT_AUTHOR = "author";
const TABLE_BOOK_ATT_ISBN = "isbn";
const TABLE_BOOK_ATT_PRICE = "price";
const TABLE_BOOK_ATT_CATEGORY = "category";
const TABLE_BOOK_ATT_IMAGE = "bookImage";

//Basket
const TABLE_BASKET_ATT_ID = "id"; //PK

//Basket Book
const TABLE_BASKET_BOOKS_ATT_ID_BASKET = "basketId"; //FK
const TABLE_BASKET_BOOKS_ATT_ID_USER = "userId"; //FK
const TABLE_BASKET_BOOKS_ATT_ID_BOOK = "bookId"; //FK
const TABLE_BASKET_BOOKS_ATT_BOOK_QTD = "bookQtd";
const TABLE_BASKET_BOOKS_ATT_BOOK_PRICE = "bookPrice";

//Purchase
const TABLE_PURCHASE_ATT_ID = "id"; //PK
const TABLE_PURCHASE_ATT_BASKET_ID = "basketId"; //FK
const TABLE_PURCHASE_ATT_USER_ID = "userId"; //FK
const TABLE_PURCHASE_ATT_IS_DELETED = "isDeleted";
const TABLE_PURCHASE_ATT_TOTAL_VALUE = "totalValue";
const TABLE_PURCHASE_ATT_AMOUNT_ITEMS = "amountItems";
const TABLE_PURCHASE_ATT_DAY = "day";
const TABLE_PURCHASE_ATT_MONTH = "month";
