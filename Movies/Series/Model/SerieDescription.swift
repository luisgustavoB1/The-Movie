//
//  SerieDescription.swift
//  Movies
//
//  Created by Luis Gustavo Oliveira Silva on 21/01/20.
//  Copyright © 2020 Luis Gustavo Oliveira Silva. All rights reserved.
//

import Foundation
struct SerieDescription: Decodable, ConvertPosterLink, ConvertBackdropLink {
    var backdropPath: String?
    let homepage: String?
    let name: String?
    let numberEpisodes: Int?
    let numberSeasons: Int?
    let overview: String?
    let posterPath: String?
    let seasons: [DescriptionSeason]?
    let voteAverage: Float?
    let id: Int?
    
    init(posterPath: String?, name: String?, voteAverage: Float?, overview: String?, backdropPath: String?, numberSeasons: Int?, homepage: String?, numberEpisodes: Int?, seasons: [DescriptionSeason]?, id: Int?) {
        self.backdropPath = backdropPath
        self.homepage = homepage
        self.name = name
        self.numberEpisodes = numberEpisodes
        self.numberSeasons = numberSeasons
        self.overview = overview
        self.posterPath = posterPath
        self.seasons = seasons
        self.voteAverage = voteAverage
        self.id = id
    }
    
    enum MovieKey: String, CodingKey {
        case backdropPath = "backdrop_path"
        case homepage
        case name
        case numberEpisodes = "number_of_episodes"
        case numberSeasons = "number_of_seasons"
        case overview
        case posterPath = "poster_path"
        case seasons
        case voteAverage = "vote_average"
        case id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieKey.self)
        let posterPath: String? = try container.decode(String.self, forKey: .posterPath)
        let name: String? = try container.decode(String.self, forKey: .name)
        let voteAverage: Float? = try container.decode(Float.self, forKey: .voteAverage)
        let overview: String? = try container.decode(String.self, forKey: .overview)
        let backdropPath: String? = try container.decode(String.self, forKey: .backdropPath)
        let numberSeasons: Int? = try container.decode(Int.self, forKey: .numberSeasons)
        let numberEpisodes: Int? = try container.decode(Int.self, forKey: .numberEpisodes)
        let seasons: [DescriptionSeason]? = try container.decode(
            [DescriptionSeason].self, forKey: .seasons)
        let homepage: String? = try container.decode(String.self, forKey: .homepage)
        let id: Int? = try container.decode(Int.self, forKey: .id)
        self.init(posterPath: posterPath, name: name, voteAverage: voteAverage, overview: overview, backdropPath: backdropPath, numberSeasons: numberSeasons, homepage: homepage, numberEpisodes: numberEpisodes, seasons: seasons, id: id )
    }
}
