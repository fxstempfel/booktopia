class Book {
  var title;
  var authors;
  var description;
  var publisher;
  var publishedDate;
  var pageCount;
  var categories;
  var language;

  // GBooks API
  Book.fromJson(Map json) {
    var volumeInfo = json['volumeInfo'];

    title = volumeInfo['title'];
    authors = volumeInfo['authors'];
    description = volumeInfo['description'];
    publisher = volumeInfo['publisher'];
    publishedDate = volumeInfo['publishedDate'];
    pageCount = volumeInfo['pageCount'];
    categories = volumeInfo['categories'];
    language = volumeInfo['language'];
  }
}