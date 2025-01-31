package com.tv.TvShow.controller;

import com.tv.TvShow.backgroundWorker.DataFetcher;
import com.tv.TvShow.model.Episode;
import com.tv.TvShow.model.TvShow;
import com.tv.TvShow.model.User;
import com.tv.TvShow.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Optional;
import java.util.Scanner;
import java.util.Set;

@RestController
public class TvShowController {

    private TvShowRepository tvShowRepository;
    private ActorRepository actorRepository;
    private EpisodeRepository episodeRepository;
    private GenreRepository genreRepository;
    private UserRepository userRepository;


    @Autowired
    public TvShowController(TvShowRepository tvShowRepository, ActorRepository actorRepository, EpisodeRepository episodeRepository, GenreRepository genreRepository, UserRepository userRepository) {
        this.tvShowRepository = tvShowRepository;
        this.actorRepository = actorRepository;
        this.episodeRepository = episodeRepository;
        this.genreRepository = genreRepository;
        this.userRepository = userRepository;
        consoleLogin(); //insert a username and password, could be new values or previously used
    }


    public void consoleLogin() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter your username: ");
        String username = scanner.nextLine();
        System.out.print("Enter your password: ");
        String password = scanner.nextLine();
        Optional<User> existingUser = userRepository.findByUsername(username);
        if (existingUser.isPresent()) {
            System.out.println("Welcome back, " + username + "!");
        } else {
            User newUser = new User(username, password);
            userRepository.save(newUser);
            System.out.println("New user registered successfully!");
        }
    }


    @GetMapping("/tvShows/getAllTvShows")
    public List<TvShow> getAllTvShows() {
        return tvShowRepository.findAll();
    }

    //for testing purposes: http://localhost:8080/tvShows/filterByGenre/{GENRE_NAME} -- check all tv shows to look for an existing genre name
    @GetMapping("tvShows/getEpisodesByTvShow/{tvShowId}")
    public List<Episode> getEpisodeByTvShow(@PathVariable Long tvShowId) {
        return episodeRepository.findByTvShowId(tvShowId);
    }

    //for testing purposes: http://localhost:8080/tvShows/sortedByField/title
    @GetMapping("tvShows/sortedByField/{field}")
    public List<TvShow> sortTvShowsByField(@PathVariable String field) {
        return tvShowRepository.findAll(Sort.by(field));
    }

    //for testing purposes: http://localhost:8080/tvShows/filterByGenre/Action
    @GetMapping("tvShows/filterByGenre/{genre}")
    public List<TvShow> filterTvShowsByGenre(@PathVariable String genre) {
        return tvShowRepository.findByGenre(genre);
    }


    //for testing purposes: http://localhost:8080/tvShows/addFavourite?username={USERNAME}&tvShowId={TVSHOWID}  -- check all tv shows to find an ID for testing
    @RequestMapping(value = "tvShows/addFavourite", method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> addFavourite(@RequestParam String username, @RequestParam int tvShowId) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        Optional<TvShow> tvShowOpt = tvShowRepository.findById(tvShowId);

        Set<TvShow> tvshowSet = null;
        if (userOpt.isPresent() && tvShowOpt.isPresent()) {
            User user = userOpt.get();
            TvShow tvShow = tvShowOpt.get();
            //Handle the Join Table dynamics - so that Spring handles creation of instance for table tvshow_actors
            tvshowSet = user.getFavouriteTvShows();
            tvshowSet.add(tvShow);
            user.setFavouriteTvShows(tvshowSet);
            userRepository.save(user);
            return ResponseEntity.ok("Added tvshow to favourites");
        }
        return ResponseEntity.badRequest().body("Invalid username or tvshow id.");
    }


    //for testing purposes: http://localhost:8080/tvShows/removeFavourite?username={USERNAME}&tvShowId={TVSHOWID}  -- check all tv shows to find an ID for testing
    @RequestMapping(value = "tvShows/removeFavourite", method = {RequestMethod.GET, RequestMethod.POST})
    public ResponseEntity<String> removeFavourite(@RequestParam String username, @RequestParam int tvShowId) {
        Optional<User> userOpt = userRepository.findByUsername(username);
        Optional<TvShow> tvShowOpt = tvShowRepository.findById(tvShowId);

        if (userOpt.isPresent() && tvShowOpt.isPresent()) {
            User user = userOpt.get();
            TvShow tvShow = tvShowOpt.get();
            user.getFavouriteTvShows().remove(tvShow);
            userRepository.save(user);
            return ResponseEntity.ok("Removed tv show from favourites");
        }
        return ResponseEntity.badRequest().body("Invalid username or invalid tvShow id.");
    }


}
