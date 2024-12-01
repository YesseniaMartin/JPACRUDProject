package com.skilldistillery.jpabooks.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Books {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int book_id;

	@Column(name = "book_title")
	private String bookTitle;

	@Column(name = "author")
	private String author;

	@Column(name = "genre")
	private String genre;

	@Column(name = "year-of")
	private Integer year;

	public Books() {
	}
	
	public Books(int book_id, String bookTitle, String author, String genre, Integer year) {
		super();
		this.book_id = book_id;
		this.bookTitle = bookTitle;
		this.author = author;
	}
	
	
	public Books(String bookTitle, String author, String genre, Integer year) {
		super();
		this.bookTitle = bookTitle;
		this.author = author;
		this.genre = genre;
		this.year = year;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public int getId() {
		return book_id;
	}

	public void setId(int book_id) {
		this.book_id = book_id;
	}

	@Override
	public String toString() {
		return "Books [id=" + book_id + ", bookTitle=" + bookTitle + ", author=" + author + ", genre=" + genre + ", year="
				+ year + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(author, bookTitle, genre, book_id, year);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Books other = (Books) obj;
		return Objects.equals(author, other.author) && Objects.equals(bookTitle, other.bookTitle)
				&& Objects.equals(genre, other.genre) && book_id == other.book_id && Objects.equals(year, other.year);
	}

}
