package com.tv.TvShow.model;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.util.*;

@Entity
@Table(name = "tvshows")
@JsonIgnoreProperties(ignoreUnknown = true)
public class TvShow {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id_tvshow;

    @JsonProperty("name")
    private String title;

    @JsonProperty("summary")
    @Column(columnDefinition = "TEXT")
    private String description;


    private Double rating;

    @JsonProperty("rating")
    private void unpackedNestedRating(Map<String, Double> rating) {
        this.rating = rating.get("average");
    }

    @JsonProperty("premiered")
    private Date release_date;

    @ManyToMany
    @JoinTable(name = "tvshow_actors", joinColumns = @JoinColumn(name = "id_tvshow"), inverseJoinColumns = @JoinColumn(name = "id_actor"))
    private Set<Actor> associatedActors = new HashSet<>();

    @ManyToMany
    @JoinTable(name = "tvshow_genres", joinColumns = @JoinColumn(name = "id_tvshow"), inverseJoinColumns = @JoinColumn(name = "id_genre"))
    private Set<Genre> associatedGenres = new HashSet<>();

    @Transient
    @JsonProperty("genres")
    private List<String> genreList = new ArrayList<>();

    @ManyToMany(mappedBy = "favouriteTvShows")
    @JsonIgnore
    private Set<User> associatedUsers = new HashSet<>();


    public TvShow() {
    }

    public TvShow(String title, String description, Double rating, Date release_date) {
        this.title = title;
        this.description = description;
        this.rating = rating;
        this.release_date = release_date;
    }


    public Integer getId_tvshow() {
        return id_tvshow;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Double getRating() {
        return rating;
    }

    public Set<Genre> getAssociatedGenres() {
        return associatedGenres;
    }

    public void setAssociatedGenres(Set<Genre> associatedGenres) {
        this.associatedGenres = associatedGenres;
    }

    public List<String> getGenreList() {
        return genreList;
    }


    public Set<Actor> getAssociatedActors() {
        return associatedActors;
    }

    public void setAssociatedActors(Set<Actor> associatedActors) {
        this.associatedActors = associatedActors;
    }
}


