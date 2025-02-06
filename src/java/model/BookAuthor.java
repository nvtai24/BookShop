/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author trung
 */
public class BookAuthor {
      private Book bookId;
    private Author authorId;

    public BookAuthor() {
    }

    public BookAuthor(Book bookId, Author authorId) {
        this.bookId = bookId;
        this.authorId = authorId;
    }

    public Book getBookId() {
        return bookId;
    }

    public void setBookId(Book bookId) {
        this.bookId = bookId;
    }

    public Author getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Author authorId) {
        this.authorId = authorId;
    }

    @Override
    public String toString() {
        return "BookAuthor{" + "bookId=" + bookId + ", authorId=" + authorId + '}';
    }
    
}
