package com.tv.TvShow.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String username;

    private String password;


    @ManyToMany
    @JoinTable(name = "user_favourites", joinColumns = @JoinColumn(name = "id_user"), inverseJoinColumns = @JoinColumn(name = "id_tvshow"))
    private Set<TvShow> favouriteTvShows = new HashSet<>();


    public User() {}
    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<TvShow> getFavouriteTvShows() {
        return favouriteTvShows;
    }

    public void setFavouriteTvShows(Set<TvShow> favouriteTvShows) {
        this.favouriteTvShows = favouriteTvShows;
    }
}
