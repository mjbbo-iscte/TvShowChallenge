# My Project 
# **TV Show API - Spring Boot & MySQL**

## **Overview**
This is a Spring Boot application that fetches TV show data from the [TVMaze API](https://www.tvmaze.com/api) and stores it in a MySQL database. It provides API endpoints to retrieve and filter TV show data.

The project includes:
- A `DataFetcher` to retrieve TV show data from the [TVMaze API](https://www.tvmaze.com/api).
- **Many-to-Many relationships** for TV shows, genres, actors and user favourites.
- **Basic user management** for tracking favorite TV shows.
- API endpoints for **sorting, filtering, and retrieving TV show information**.

---

## **Technologies Used**
- **Java 17**
- **Spring Boot**
- **Spring Data JPA**
- **Spring Web**
- **MySQL**
- **Hibernate ORM**
- **RestTemplate** (for API calls)

---

## **How to Set Up & Run**
### **1️⃣ Configure MySQL**
1. **Create a database** using the provided SQL dump (`MySql_tvshowdb_data_export.sql`).


2. **Update `application.properties`**:
   - Inside `src/main/resources/application.properties`, update the MySQL **username** and **password**:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/tvshowdb
     spring.datasource.username=your_mysql_username
     spring.datasource.password=your_mysql_password
     ```

### **2️⃣ Run the Application**
1. Open your terminal or IDE (IntelliJ).
2. Run the main class:  
   **`TvShowApplication.java`**
   - This will **ask for a username and password** in the console (stored in the `users` table).
   - **Fetches and stores 4 TV shows** from TVMaze for quick testing thanks to 'DataFetcher´.

---

## **Database Schema**
The database consists of the following tables:

### **1️⃣ Main Tables**
| Table Name  | Description |
|-------------|------------|
| `tvshows` | Stores TV show details (title, description, rating, release date). |
| `actors` | Stores actor details (name). |
| `genres` | Stores genre names. |
| `episodes` | Stores episode details (season, episode number, release date). |

### **2️⃣ Join Tables (Many-to-Many Relationships)**
| Table Name | Purpose |
|------------|---------|
| `tvshow_actors` | Links TV shows with actors. |
| `tvshow_genres` | Links TV shows with genres. |
| `user_favourites` | Links users with their favorite TV shows. |

---


## **Endpoints**
| Method | Endpoint | Description |
|--------|----------|-------------|
| **GET** | `/tvShows/getAllTvShows` | Retrieve all TV shows. |
| **GET** | `/tvShows/getEpisodesByTvShow/{tvShowId}` | Get episodes for a specific TV show. |
| **GET** | `/tvShows/sortedByField/{field}` | Sort TV shows by a given field (e.g., `title`, `rating`). |
| **GET** | `/tvShows/filterByGenre/{genre}` | Get TV shows by genre. |
| **POST** | `/tvShows/addFavourite?username={username}&tvShowId={tvShowId}` | Add a TV show to user favorites. |
| **POST** | `/tvShows/removeFavourite?username={username}&tvShowId={tvShowId}` | Remove a TV show from user favorites. |

---


## **Known Issues**
### **❌ Issues:**
1. **API Data Fetching & JSONProperty Conflicts:**  
   - Since data is fetched from an external API, the entity attributes must **match the database column names**.
   - However, to correctly map data from TVMaze, **`@JsonProperty` annotations** were used.
   - This causes **duplicate field labels** when returning API responses.

2. **Authentication System Not Fully Implemented:**  
   - Currently, only a **console login** exists.
   - Users are stored in MySQL, and their **favorites** can be saved, but there’s **no actual authentication system**.

3. **Background Worker Not Fully Functional:**  
   - The `DataFetcher` currently **fetches TV shows once at startup**.
   - It **does not periodically check for new data** from TVMaze.

4. **No Unit Tests:**  
   - Due to time constraints, no **JUnit tests** or **integration tests** were written.

---


### **Final Deliverable**
📂 **ZIP Contents**
```
📁 TvShow.zip
    ├── 📁 TvShow/  (Spring Boot source code)
    ├── 📄 README.md
    ├── 📄 MySql_tvshowdb_data_export.sql  (MySQL export)
```

---
