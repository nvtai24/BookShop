/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.nio.channels.Pipe;
import java.util.Date;
import java.util.List;

/**
 *
 * @author trung
 */
public class Book {
  private int bookId;
    private Category categoryId;
    private String title;
    private int rating;
    private double price;
    private int viewCount;
    private int quantityInStock;
    private int quantitySold;
    private Date releaseDate;
    private String description; 
    private List<Author> listAuthor;
    private String image ; 

    public Book(int bookId, Category categoryId, String title, int rating, double price, int viewCount, int quantityInStock, int quantitySold, Date releaseDate, String description, String image) {
        this.bookId = bookId;
        this.categoryId = categoryId;
        this.title = title;
        this.rating = rating;
        this.price = price;
        this.viewCount = viewCount;
        this.quantityInStock = quantityInStock;
        this.quantitySold = quantitySold;
        this.releaseDate = releaseDate;
        this.description = description;
        this.image = image;
    }

    public Book() {
    }

    public Book(int bookId, Category categoryId, String title, int rating, double price, int viewCount, int quantityInStock, int quantitySold, Date releaseDate, String description, List<Author> listAuthor, String image) {
        this.bookId = bookId;
        this.categoryId = categoryId;
        this.title = title;
        this.rating = rating;
        this.price = price;
        this.viewCount = viewCount;
        this.quantityInStock = quantityInStock;
        this.quantitySold = quantitySold;
        this.releaseDate = releaseDate;
        this.description = description;
        this.listAuthor = listAuthor;
        this.image = image;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }


    public List<Author> getListAuthor() {
        return listAuthor;
    }

    public void setListAuthor(List<Author> listAuthor) {
        this.listAuthor = listAuthor;
    }

    

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

   
    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

   

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    public int getQuantitySold() {
        return quantitySold;
    }

    public void setQuantitySold(int quantitySold) {
        this.quantitySold = quantitySold;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Book{" + "bookId=" + bookId + ", categoryId=" + categoryId + ", title=" + title + ", rating=" + rating + ", price=" + price + ", viewCount=" + viewCount + ", quantityInStock=" + quantityInStock + ", quantitySold=" + quantitySold + ", releaseDate=" + releaseDate + ", description=" + description + ", listAuthor=" + listAuthor + '}';
    }

  
  
}
