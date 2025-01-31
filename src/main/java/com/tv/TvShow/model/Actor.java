package com.tv.TvShow.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "actors")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Actor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id_actor;

    private String name; //must have the same designation as the argument in method findByName in ActorRepository

    @ManyToMany(mappedBy = "associatedActors")
    @JsonIgnore
    private Set<TvShow> associatedTvShows = new HashSet<>();


    public Actor() { }

    public Actor(String name) {
        this.name = name;
    }
    public Actor(Integer id, String name) {
        this.id_actor = id;
        this.name = name;
    }


    public Integer getId_actor() {
        return id_actor;
    }

    public String getName() {
        return name;
    }

}
