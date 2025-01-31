package com.tv.TvShow.repository;

import com.tv.TvShow.model.Actor;
import com.tv.TvShow.model.Genre;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ActorRepository extends JpaRepository<Actor, Integer> {

    Optional<Actor> findByName(String name);
}
