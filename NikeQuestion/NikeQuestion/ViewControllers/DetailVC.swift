//
//  DetailVC.swift
//  NikeQuestion
//
//  Created by Revanth Matha on 9/6/19.
//  Copyright © 2019 Revanth Matha. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {


    var album : AlbumJson?
    let albumImageView = UIImageView()
    let albumName = UILabel()
    let albumArtist = UILabel()
    var genres = [Genres]()
    let genre = UILabel()
    let releaseDate = UILabel()
    let copyrightInfo = UILabel()
    let itunesButton = UIButton()
//    let backgroundV
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.view.backgroundColor =  .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        setupView()
        
        albumImageView.image = album?.albumImage
        albumName.text = album?.name
        albumArtist.text = album?.artistName
        var genres = album?.genres
        releaseDate.text = album?.releaseDate
        copyrightInfo.text = album?.copyright
        
        

    }
    
    
    public func stroke(font: UIFont, strokeWidth: Float, insideColor: UIColor, strokeColor: UIColor) -> [NSAttributedString.Key: Any]{
        return [
            NSAttributedString.Key.strokeColor : strokeColor,
            NSAttributedString.Key.foregroundColor : insideColor,
            NSAttributedString.Key.strokeWidth : -strokeWidth,
            NSAttributedString.Key.font : font
        ]
    }
    
    
    func setupView() {
        view.addSubview(albumImageView)
        view.addSubview(albumName)
        view.addSubview(albumArtist)
        view.addSubview(genre)
        view.addSubview(releaseDate)
        view.addSubview(copyrightInfo)
        view.addSubview(itunesButton)
        
        albumUIImageView()
        albumUIName()
        albumUIArtist()
        UIgenre()
        UIreleaseDate()
        UIcopyrightInfo()
        itunesUIButton()
        
    }
    
    
    func albumUIImageView() {
        let image = album?.albumImage
        
        albumImageView.translatesAutoresizingMaskIntoConstraints = false

        
        albumImageView.image = image!
        
        if #available(iOS 11.0, *) {
            albumImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        } else {
            albumImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 30).isActive = true
        }
        
        albumImageView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2, constant: 0).isActive = true
        //widthconstraight
        albumImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2, constant: 0).isActive = true
        
        albumImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
    }
    
    func UIcopyrightInfo() {
        
        copyrightInfo.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //background colour
        copyrightInfo.translatesAutoresizingMaskIntoConstraints = false
        //enable autolayout
        
        //bottom constraint
        copyrightInfo.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 10).isActive = true
        //top constraint
        copyrightInfo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        //widthconstraight
        copyrightInfo.heightAnchor.constraint(equalToConstant: 20)

        //heightConstraint
        copyrightInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //CenterX
        copyrightInfo.textColor = .black
        
//        copyrightInfo.adjustsFontSizeToFitWidth = true

        copyrightInfo.lineBreakMode = .byTruncatingMiddle
        
        copyrightInfo.attributedText = NSMutableAttributedString(string: album!.copyright, attributes: stroke(font: UIFont(name: "Menlo-Regular", size: 12)!, strokeWidth: 1, insideColor: .init(red: 21/255, green: 106/255, blue: 181/255, alpha: 1 ), strokeColor: .black))
        copyrightInfo.textAlignment = .center

        
    }
    
    func albumUIName() {
        
        albumName.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //background colour
        albumName.translatesAutoresizingMaskIntoConstraints = false
        //enable autolayout
        
        //bottom constraint
        albumName.topAnchor.constraint(equalTo: copyrightInfo.bottomAnchor, constant: 10).isActive = true
        //top constraint
        albumName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        //widthconstraight
        
        albumName.heightAnchor.constraint(equalToConstant: 20)
        
        //heightConstraint
        albumName.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //CenterX
        albumName.textColor = .black
        
        albumName.attributedText = NSMutableAttributedString(string: album!.name
            , attributes: stroke(font: UIFont(name: "Menlo-Regular", size: 12)!, strokeWidth: 1, insideColor: .init(red: 21/255, green: 106/255, blue: 181/255, alpha: 1 ), strokeColor: .black))
        albumName.textAlignment = .center

    }
    
    func albumUIArtist() {
        
        albumArtist.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //background colour
        albumArtist.translatesAutoresizingMaskIntoConstraints = false
        //enable autolayout
        
        //bottom constraint
        albumArtist.topAnchor.constraint(equalTo: albumName.bottomAnchor, constant: 10).isActive = true
        //top constraint
        albumArtist.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        //widthconstraight
        albumArtist.heightAnchor.constraint(equalToConstant: 20)
        //heightConstraint
        albumArtist.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //CenterX
        albumArtist.textColor = .black
        
        albumArtist.attributedText = NSMutableAttributedString(string: album!.artistName, attributes: stroke(font: UIFont(name: "Menlo-Regular", size: 12)!, strokeWidth: 1, insideColor: .init(red: 21/255, green: 106/255, blue: 181/255, alpha: 1 ), strokeColor: .black))
        albumArtist.textAlignment = .center

    }

    func UIgenre() {
        
        genre.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //background colour
        genre.translatesAutoresizingMaskIntoConstraints = false
        //enable autolayout
        
        //bottom constraint
        genre.topAnchor.constraint(equalTo: albumArtist.bottomAnchor, constant: 10).isActive = true
        //top constraint
        genre.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        //widthconstraight
        genre.heightAnchor.constraint(equalToConstant: 20)
        
        //heightConstraint
        genre.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //CenterX
        genre.textColor = .black
        
        //        copyrightInfo.adjustsFontSizeToFitWidth = true
        
        genre.lineBreakMode = .byTruncatingMiddle
        
        var genreHolder = album!.genres
        var genrey = genreHolder[0]
        var genreName = genrey.name

        genre.attributedText = NSMutableAttributedString(string: "Rap",attributes: stroke(font: UIFont(name: "Menlo-Regular", size: 12)!, strokeWidth: 1, insideColor: .init(red: 21/255, green: 106/255, blue: 181/255, alpha: 1 ), strokeColor: .black))
        genre.textAlignment = .center

    }

    func UIreleaseDate() {
        
        releaseDate.backgroundColor = .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //background colour
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        //enable autolayout
        
        //bottom constraint
        releaseDate.topAnchor.constraint(equalTo: genre.bottomAnchor, constant: 20).isActive = true
        //top constraint
        releaseDate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8, constant: 0).isActive = true
        //widthconstraight
        releaseDate.heightAnchor.constraint(equalToConstant: 20)
        
        //heightConstraint
        releaseDate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        //CenterX
        releaseDate.textColor = .black
        
        //        copyrightInfo.adjustsFontSizeToFitWidth = true
        
        releaseDate.lineBreakMode = .byTruncatingMiddle
        
        releaseDate.attributedText = NSMutableAttributedString(string: album!.releaseDate, attributes: stroke(font: UIFont(name: "Menlo-Regular", size: 12)!, strokeWidth: 1, insideColor: .init(red: 21/255, green: 106/255, blue: 181/255, alpha: 1 ), strokeColor: .black))
        releaseDate.textAlignment = .center
    }
    

    
    func itunesUIButton() {
        
        itunesButton.translatesAutoresizingMaskIntoConstraints = false
//        //enable autolayout
//
        
        itunesButton.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true

        itunesButton.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 20).isActive = true
    
        itunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        //widthconstraight
        itunesButton.heightAnchor.constraint(equalToConstant: 20).isActive = true

        //heightConstraint
        itunesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:0).isActive = true
        //CenterX
//
        itunesButton.setTitleColor(.black, for: .normal)
        itunesButton.backgroundColor = .white
        itunesButton.titleLabel?.font = UIFont(name: "Menlo-Regular", size: 20)
        itunesButton.layer.borderColor = UIColor.black.cgColor
        itunesButton.layer.borderWidth = 1
        itunesButton.setTitle("ITunes Link", for: .normal)
        itunesButton.addTarget(self, action: #selector(openItunes), for: .touchUpInside)

    }
    
    @objc func openItunes(sender: UIButton!) {
        
        UIApplication.shared.openURL(NSURL(string: album!.artistUrl) as! URL)

    }



}
