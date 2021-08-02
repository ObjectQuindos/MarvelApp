//
//  Character.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    var description: String?
    let modifiedDate: String
    var thumbnail: Thumbnail?
    
    var comics: [Comic] = []
    var stories: [Story] = []
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case modifiedDate = "modified"
        case thumbnail = "thumbnail"
    }
    
    public func getDescription() -> String {
        if self.description == "" || self.description == nil {
            return "Sin descripción"
        }
        return self.description!
    }
}

struct Thumbnail: Codable {
    var path: String?
    var extenssion: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case extenssion = "extension"
    }
    
    func completeURLPath() -> URL? {
        let path = (self.path ?? "") + "." + (self.extenssion ?? "")
        return URL(string: path)
    }
}

protocol Resource {
    var name: String { get }
    var resourceURI: String { get }
}

struct Comics: Codable {
    var items: [Comic] = []
    
    enum ComicsKey: String, CodingKey {
        case items
    }
}

struct Stories: Codable {
    var items: [Story] = []
    
    enum StoriesKey: String, CodingKey {
        case items
    }
}

struct Comic: Resource, Codable {
    var name: String = ""
    var resourceURI: String = ""
    
    enum ComicKey: String, CodingKey {
        case name
        case resourceURI
    }
}

struct Story: Resource, Codable {
    var name: String = ""
    var resourceURI: String = ""
    
    enum StoryKey: String, CodingKey {
        case name
        case resourceURI
    }
}

extension Character {
    
    mutating func updateInfo(json: [String : Any]) {
        let decoder = JSONDecoder()
        
        let comics = json["comics"] as? [String : Any] ?? [:]
        let comicsData = Data(comics.toJSONString().utf8)
        let comicsArray = try! decoder.decode(Comics.self, from: comicsData)
        self.comics = comicsArray.items
        
        let stories = json["stories"] as? [String : Any] ?? [:]
        let storiesData = Data(stories.toJSONString().utf8)
        let storiesArray = try! decoder.decode(Stories.self, from: storiesData)
        self.stories = storiesArray.items
    }
}
