package com.tv.TvShow.repository;

import com.tv.TvShow.model.TvShow;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface TvShowRepository extends JpaRepository<TvShow, Integer> {

    @Query("SELECT tvs FROM TvShow tvs JOIN tvs.associatedGenres g WHERE g.name = :genre")
    List<TvShow> findByGenre(String genre);


}
