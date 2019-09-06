//
//  AlbumInformation.swift
//  NikeQuestion
//
//  Created by Revanth Matha on 9/3/19.
//  Copyright © 2019 Revanth Matha. All rights reserved.
//

import Foundation
import UIKit


struct Genres {
    var genreId : String
    var name : String
    var url : String
}

struct AlbumJson {
    
    var artistName : String
    var id : String
    var releaseDate : String
    var name : String
    var kind : String
    var copyright : String
    var artistId : String
    var artistUrl : String
    var artworkUrl100 : String
    var genres : [Genres]
    var url : String
    var albumImage = UIImage(named: "Image")
//    var albumImageView = UIImageView(image: UIImage(named: "Image"))
}
