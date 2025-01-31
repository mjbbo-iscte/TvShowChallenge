package com.tv.TvShow.backgroundWorker;

import com.tv.TvShow.model.Actor;
import com.tv.TvShow.model.Episode;
import com.tv.TvShow.model.Genre;
import com.tv.TvShow.model.TvShow;
import com.tv.TvShow.repository.ActorRepository;
import com.tv.TvShow.repository.EpisodeRepository;
import com.tv.TvShow.repository.GenreRepository;
import com.tv.TvShow.repository.TvShowRepository;
import jakarta.annotation.PostConstruct;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class DataFetcher {

    @Autowired
    private final RestTemplate restTemplate;
    private final TvShowRepository tvShowRepository;
    private final ActorRepository actorRepository;
    private final EpisodeRepository episodeRepository;
    private final GenreRepository genreRepository;
    private final String URL_TV_SHOW_MAIN_DATA = "https://api.tvmaze.com/shows";
    private final String URL_SUFFIX_EPISODE_DATA = "/episodes";
    private final String URL_SUFFIX_ACTOR_DATA = "/cast";
    private int limit = 4; //for testing purposes, added a limit on the amount of tvshows to add to the mysql database

    public DataFetcher(RestTemplate restTemplate, TvShowRepository tvShowRepository, ActorRepository actorRepository, EpisodeRepository episodeRepository, GenreRepository genreRepository) {
        this.restTemplate = restTemplate;
        this.tvShowRepository = tvShowRepository;
        this.actorRepository = actorRepository;
        this.episodeRepository = episodeRepository;
        this.genreRepository = genreRepository;
    }


    @PostConstruct
    @Transactional
//    @Scheduled(fixedDelay = 60)
    public void fetchTvShowData() {
        int count = 0;
        ResponseEntity<TvShow[]> httpResponse = restTemplate.getForEntity(URL_TV_SHOW_MAIN_DATA, TvShow[].class);
        if(httpResponse.getStatusCode() == HttpStatus.OK && httpResponse.getBody() != null) {
            for(TvShow tvShow: httpResponse.getBody()) {
                if(count >= limit) break;
                handleTvShowData(tvShow);
                count++;
            }
        }
    }



    private void handleTvShowData(TvShow tvShow) {
        TvShow savedTvShow = tvShowRepository.save(tvShow);
        handleGenreData(savedTvShow);
        handleActorData(savedTvShow);
        handleEpisodeData(savedTvShow);
        tvShowRepository.save(tvShow);
    }

    private void handleActorData(TvShow tvShow) {
        //Make the http request to the adequate endpoint of the api
        String urlActorData = (URL_TV_SHOW_MAIN_DATA + "/" + tvShow.getId_tvshow() + URL_SUFFIX_ACTOR_DATA);
        ResponseEntity<List> httpResponse = restTemplate.getForEntity(urlActorData, List.class);
        List<Map<String, Object>> castList = (List<Map<String, Object>>) httpResponse.getBody();

        Set<Actor> actorSet = null;

        //Run through the Json with the cast members and extracting the actors' names accordingly
        for(Map<String, Object> castMember: castList) {
            Map<String, Object> person = (Map<String, Object>) castMember.get("person");
            String actorName = (String) person.get("name");
            //Check if actor already exists in MySQL database
            Actor actor = actorRepository.findByName(actorName).orElse(null);
            if(actor == null) {
                actor = new Actor(actorName);
            }
            actorRepository.save(actor);
            //Handle the Join Table dynamics - so that Spring handles creation of instance for table tvshow_actors
            actorSet = tvShow.getAssociatedActors();
            actorSet.add(actor);
            tvShow.setAssociatedActors(actorSet);
        }
    }

    private void handleEpisodeData(TvShow tvShow) {
        //Make the http request to the adequate endpoint of the api
        String urlEpisodeData = (URL_TV_SHOW_MAIN_DATA + "/" + tvShow.getId_tvshow() + URL_SUFFIX_EPISODE_DATA);
        ResponseEntity<Episode[]> httpResponse = restTemplate.getForEntity(urlEpisodeData, Episode[].class);

        if(httpResponse.getStatusCode() == HttpStatus.OK && httpResponse.getBody() != null) {
            for(Episode episode: httpResponse.getBody()) {
                episode.setId_tvshow(tvShow.getId_tvshow());
                episodeRepository.save(episode);
            }
        }
    }

    private void handleGenreData(TvShow tvShow) {
        Set<Genre> genreSet = null;

        //Run through the list of genres from the Json
        for (String genreName: tvShow.getGenreList()) {
            //Check if genre already exists in MySQL database
            Genre genre = genreRepository.findByName(genreName).orElse(null);
            if(genre == null) {
                genre = new Genre(genreName);
            }
            genreRepository.save(genre);

            //Handle the Join Table dynamics - so that Spring handles creation of instance for table tvshow_genres
            genreSet = tvShow.getAssociatedGenres();
            genreSet.add(genre);
            tvShow.setAssociatedGenres(genreSet);
        }
    }

}
