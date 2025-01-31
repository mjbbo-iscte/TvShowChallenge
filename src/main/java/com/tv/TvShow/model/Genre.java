package com.tv.TvShow.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "genres")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Genre {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id_genre;

    @Column(name = "genre_name")
    private String name; //must have the same designation as the argument in method findByName in GenreRepository

    @ManyToMany(mappedBy = "associatedGenres")
    @JsonIgnore
    private Set<TvShow> associatedTvShows = new HashSet<>();


    public Genre() { }
    public Genre(String genre_name) {
        name = genre_name;
    }
    public Genre(Integer id, String genre_name) {
        this.id_genre = id;
        name = genre_name;
    }

    public Integer getId_genre() {
        return id_genre;
    }

    public String getName() {
        return name;
    }

    public Set<TvShow> getAssociatedTvShows() {
        return associatedTvShows;
    }

}
