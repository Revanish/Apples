//
//  MainVC.swift
//  NikeQuestion
//
//  Created by Revanth Matha on 8/30/19.
//  Copyright © 2019 Revanth Matha. All rights reserved.
//

import Foundation
import UIKit


class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let vc = DetailVC()
    
    
    var albumArray = [AlbumJson]()
    var artistNameArray = [String]()
    var idArray = [String]()
    var releaseDateArray = [String]()
    var nameArray = [String]()
    var kindArray = [String]()
    var copyRightArray = [String]()
    var artistIdArray = [String]()
    var artistUrlArray = [String]()
    var artistArtworkUrlArray = [String]()
    
    var selectedAlbum : AlbumJson?

    var genreId = String()
    var name = String()
    var url = String()
    var genresArray = [Genres]()
    var urlArray = [String]()
    
    let albumcell = "albumcell"
    
   var albumTV = UITableView()
   var navBar = UINavigationBar()

    override func viewDidLoad() {
        
        albumTV.dataSource = self
        albumTV.delegate = self
        
        super.viewDidLoad()
     //   createAlbumArray()
        setupTableView()
        getAlbumInfo()
        view.backgroundColor = .white
        navBar = self.navigationController!.navigationBar
       // setupTableView()
        setupNavBar()
        albumTV.register(AlbumCell.self, forCellReuseIdentifier: "albumcell")

    }
    
    
    
    
    func createAlbumArray() {
        
        var genre1 = Genres(genreId: "34", name: "Rap", url: "some string")
        
        albumArray.append(AlbumJson(artistName: "Revanth", id: "1", releaseDate: "today", name: "now", kind: "music", copyright: "what is copyright", artistId: "Artist", artistUrl: "url is good", artworkUrl100: "this is a hyperlink", genres: [genre1] , url: "this is a itunes link", albumImage: UIImage(named: "Image")))
        
    }
    
    func getAlbumInfo() {
        
        var jData = Data()
        var jString = String()
        
        let headers = [
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "97164776-b919-49d2-a9fb-1297b6b78b48,3ceafe7d-4380-4db4-9162-16fc29bb0ff0",
            "Host": "rss.itunes.apple.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
                
                jString = String(data: data!, encoding: .utf8)!
                jData = data!

                
//                print("jString: " + String(jString))
                
                self.AlbumWS(response: jString,  data: jData)
                
                DispatchQueue.main.sync {
                    self.refreshView()
                }
                
                
                
            }
            
        })
        
        dataTask.resume()


}
    
    func AlbumWS(response: String, data: Data)  {
        do
        {
            //print("R is: ",resp)
            let jsonArray = try JSONSerialization.jsonObject(with: data as Data, options : .allowFragments) as? Dictionary<String,Any>
            //print("JSON ARRAY IS: ",jsonArray!["feed"])
            let feedArray = jsonArray!["feed"] as? Dictionary<String,Any>
            let resultArray = feedArray!["results"] as? [Dictionary<String,Any>]

            for record in 0..<resultArray!.count
            {
//                print("Artist Name: ",resultArray![record]["artistName"] as! String)
//                print("Album ID ",resultArray![record]["id"] as! String)
//                print("Album Release Date: ",resultArray![record]["releaseDate"])
//                print("Album Kind: ",resultArray![record]["kind"])
//                print("Album Copyright: ",resultArray![record]["copyright"])
//                print("Artist ID: ",resultArray![record]["artistId"])
//                print("Artist URL: ",resultArray![record]["artistUrl"])
//                print("Artwork URL: ",resultArray![record]["artworkUrl100"])
//                print("Album Genres: ",resultArray![record]["genres"])
//                print("ITunes URL: ",resultArray![record]["url"])
                
                let genreArray = resultArray![record]["genres"]  as! Array<Dictionary<String,String>>
                
                for genre in 0..<genreArray.count {
                    
                    let genreId = genreArray[genre]["genreId"] as! String
                    self.genreId = genreId
                    
                    let name = genreArray[genre]["name"] as!  String
                    self.name = name
                    
                    let url = genreArray[genre]["url"] as!  String
                    self.url = url
                    
                    var genreRecord = Genres(genreId: genreId, name: name, url: url)
                    genresArray.append(genreRecord)
                }
                
                
                let artistNameRecord = resultArray![record]["artistName"] as! String
                artistNameArray.append(artistNameRecord)
                //artistNameArray.append(resultArray![record]["artistName"] as! String)
                
                let idRecord = resultArray![record]["id"] as! String
                idArray.append(idRecord)
//                idArray.append(resultArray![record]["id"] as! String)
                
                let releaseDateRecord = resultArray![record]["releaseDate"] as! String
                releaseDateArray.append(releaseDateRecord)
//                releaseDateArray.append(resultArray![record]["releaseDate"] as! String)
                
                let nameRecord = resultArray![record]["name"] as! String
                nameArray.append(nameRecord)
                //                releaseDateArray.append(resultArray![record]["name"] as! String)
                
                let kindRecord = resultArray![record]["kind"] as! String
                kindArray.append(kindRecord)
//                kindArray.append(resultArray![record]["kind"] as! String)
                
                let copyrightRecord = resultArray![record]["copyright"] as! String
                copyRightArray.append(copyrightRecord)
//                copyRightArray.append(resultArray![record]["copyright"] as! String)
                
                let artistIdRecord = resultArray![record]["artistId"] as! String
                artistIdArray.append(artistIdRecord)
//                artistIdArray.append(resultArray![record]["artistId"] as! String)

                let artistUrlRecord = resultArray![record]["artistUrl"] as! String
                artistUrlArray.append(artistUrlRecord)
//                artistUrlArray.append(resultArray![record]["artistUrl"] as! String)

                let artworkUrl100Record = resultArray![record]["artworkUrl100"] as! String
                artistArtworkUrlArray.append(artworkUrl100Record)
//                artistArtworkUrlArray.append(resultArray![record]["artworkUrl100"] as! String)
                
                let urlRecord = resultArray![record]["url"] as! String
                urlArray.append(urlRecord)
                //                urlArray.append( resultArray![record]["url"] as! String)
                
                var artworkImage = UIImage()

                DispatchQueue.main.async {
                    let url = URL(string: artworkUrl100Record)
                    let data = try? Data(contentsOf: url!)
                    if let imageData = data {
                        
                        artworkImage = UIImage(data: imageData)!
                    }
                    
                    self.albumArray.append(AlbumJson(artistName: artistNameRecord, id: idRecord, releaseDate: releaseDateRecord, name: nameRecord, kind: kindRecord, copyright: copyrightRecord, artistId: artistIdRecord, artistUrl: artistUrlRecord, artworkUrl100: artworkUrl100Record, genres: self.genresArray, url: urlRecord, albumImage: artworkImage))
                    
                    self.genresArray.removeAll()

                }
                
          
   
//                    albumArray.append(AlbumJson(artistName: artistNameRecord, id: idRecord, releaseDate: releaseDateRecord, name: nameRecord, kind: kindRecord, copyright: copyrightRecord, artistId: artistIdRecord, artistUrl: artistUrlRecord, artworkUrl100: artworkUrl100Record, genres: genresArray, url: urlRecord, albumImage: artworkImage))
                
                
//                DispatchQueue.main.async {
//                var albumImageRecord = UIImage()
//                var albumImageViewRecord = UIImageView(image: albumImageRecord)
//                    setAlbumImageRecord(albumImageRecord: albumImageRecord, albumImageViewRecord : albumImageViewRecord)
//                }

                
//                getImage()
                
            }
            print(albumArray)
            DispatchQueue.main.sync {
                self.refreshView()
            }
            

        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
            print("what is going on")
        }
        

    }
    
    func refreshView() {
        
        DispatchQueue.main.async {
//            self.albumTV.register(AlbumCell.self, forCellReuseIdentifier: "albumcell")
            self.albumTV.reloadData()
        }
        
    }
    
    func setupNavBar() {
    
    navBar = self.navigationController!.navigationBar
    
    self.title = "Top 100"
    navBar.isTranslucent = false
    navBar.barTintColor = .init(red: 255/255, green: 102/255, blue: 0/255, alpha: 1)
    navBar.barStyle = .black
    
    }

    func setupTableView() {
        
        albumTV.register(AlbumCell.self, forCellReuseIdentifier: "albumcell")
        
        view.addSubview(albumTV)
        
        albumTV.translatesAutoresizingMaskIntoConstraints = false
        
        albumTV.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true

        albumTV.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        albumTV.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        albumTV.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true

    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumcell", for: indexPath) as! AlbumCell
        let currentLastItem = albumArray[indexPath.row]
        cell.album = currentLastItem
        return cell
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumArray.count
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        if(segue.identifier == "DetailVC") {
//            var vc = segue.destination as! DetailVC
//            vc.album = selectedAlbum
//        }
//
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        selectedAlbum = albumArray[indexPath.row]
        
        vc.album = selectedAlbum

        navigationController?.pushViewController(vc, animated: true)
        
}
    

}
