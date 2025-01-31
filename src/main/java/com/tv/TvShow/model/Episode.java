package com.tv.TvShow.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "episodes")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Episode {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id_episode;

    @JsonProperty("name")
    private String title;

    @JsonProperty("season")
    private Integer season_number;
    private Integer id_tvshow;

    @JsonProperty("number")
    private Integer episode_number;

    @JsonProperty("airdate")
    private Date release_date;


    public Episode() { }

    public Episode(Integer id, String title, Integer season_number, Integer id_tvshow, Integer episode_number, Date release_date) {
        this.id_episode = id;
        this.title = title;
        this.season_number = season_number;
        this.id_tvshow = id_tvshow;
        this.episode_number = episode_number;
        this.release_date = release_date;
    }


    public Integer getId_episode() {
        return id_episode;
    }

    public String getTitle() {
        return title;
    }

    public Integer getSeason_number() {
        return season_number;
    }

    public Integer getId_tvshow() {
        return id_tvshow;
    }

    public void setId_tvshow(Integer id_tvshow) {
        this.id_tvshow = id_tvshow;
    }

    public Integer getEpisode_number() {
        return episode_number;
    }

    public Date getRelease_date() {
        return release_date;
    }
}
