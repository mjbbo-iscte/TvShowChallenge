package com.tv.TvShow.repository;

import com.tv.TvShow.model.Episode;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EpisodeRepository extends JpaRepository<Episode, Integer> {

    @Query("SELECT e FROM Episode e WHERE e.id_tvshow = :tvShowId")
    List<Episode> findByTvShowId(Long tvShowId);
}
