//
//  AlbumCell.swift
//  NikeQuestion
//
//  Created by Revanth Matha on 9/3/19.
//  Copyright © 2019 Revanth Matha. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    var album : AlbumJson? {
        didSet {
            
            albumImage.image = album!.albumImage!
            
            
            //async download code
//            albumImage.downloaded(from: album!.artworkUrl100)
            albumName.text = "Album: " + album!.name
            artistName.text =  "Artist: " + album!.artistName
        }
    }
    
    private let albumName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
//        lbl.backgroundColor = .blue
        return lbl
    }()
    
    
    private let albumImage : UIImageView = {
        let image = UIImage(named: "Image")
        let imgView = UIImageView(image: image)
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
//        imgView.backgroundColor = .green

        return imgView
    }()
    
    
    
    var artistName : UILabel =  {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
//        lbl.backgroundColor = .red
        return lbl

    }()
    
    func logoUIImage() {

        //        logoImage.backgroundColor = .init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        let imageName = "Image"
        albumImage.image = UIImage(named: imageName)

        albumImage.translatesAutoresizingMaskIntoConstraints = false

        albumImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 0).isActive = true

        albumImage.widthAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1.0, constant: 0).isActive = true
        //widthconstraight
        albumImage.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 1.0, constant: 0).isActive = true
        //heightConstraint
        albumImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 0).isActive = true
        
        //left constrait

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(albumImage)
        addSubview(albumName)
        addSubview(artistName)
//        addSubview(decreaseButton)
//        addSubview(productQuantity)
//        addSubview(increaseButton)
        
//        albumImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: frame.size.width * 0.05, paddingLeft: frame.size.width * 0.05, paddingBottom: frame.size.width * 0.05, paddingRight: frame.size.width * 0.05, width: contentView.frame.height, height: contentView.frame.height, enableInsets: false)
        logoUIImage()
        albumName.anchor(top: topAnchor, left: albumImage.rightAnchor , bottom: nil, right: rightAnchor, paddingTop: contentView.frame.height/3, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: self.contentView.frame.width - albumImage.frame.height, height: contentView.frame.height/2, enableInsets: false)
        artistName.anchor(top: albumName.bottomAnchor, left: albumImage.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: contentView.frame.height/3, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: self.contentView.frame.width - albumImage.frame.width, height: contentView.frame.height/2, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension UIView {
    
    func anchor (top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat, enableInsets: Bool) {
        var topInset = CGFloat(0)
        var bottomInset = CGFloat(0)
        
        if #available(iOS 11, *), enableInsets {
            let insets = self.safeAreaInsets
            topInset = insets.top
            bottomInset = insets.bottom
            
            print("Top: \(topInset)")
            print("bottom: \(bottomInset)")
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop+topInset).isActive = true
        }
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom-bottomInset).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
    }
    
}

//async download code

extension UIImageView {
    
    
// // allows async
    
//    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
//        contentMode = mode
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() {
//                self.image = image
//            }
//            }.resume()
//    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
//         DispatchQueue.main.async() {
//        guard let url = URL(string: link) else { return }
//        self.downloaded(from: url, contentMode: mode)
//        }
//    }
//

}
