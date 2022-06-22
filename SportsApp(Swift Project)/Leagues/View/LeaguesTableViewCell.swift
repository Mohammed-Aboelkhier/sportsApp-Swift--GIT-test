//
//  LeaguesTableViewCell.swift
//  SportsApp(Swift Project)
//
//  Created by Mohammed Emad Aboelkhier  on 15/06/2022.
//

import UIKit
import SwiftUI

class LeaguesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leagueBadge: UIImageView!
    @IBOutlet weak var LeagueName: UILabel!
    var youtubeURL : String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func openVideoButton(_ sender: UIButton) {
//        if let url = URL(string: "https://www.youtube.com") {
//            print ("******************")
//            print (url)
//            if UIApplication.shared.canOpenURL(url) {
//                UIApplication.shared.open(url, options: [:])
             //}
        print ("*******\(youtubeURL)L**********")
        var formattedURL = "https:\(youtubeURL)"
        //ormattedURL.append(youtubeURL)
            if let url = URL(string: formattedURL) {
                print ("******************")
                print (url)
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:])
                 }

            UIApplication.shared.open(url)
        }
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
