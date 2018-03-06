//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Charles Hieger on 6/18/17.
//  Copyright © 2017 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var rtImageView: UIImageView!
    
    @IBAction func rtAction(_ sender: Any) {
        if(tweet.retweeted){
            tweet.retweetCount-=1
            tweet.retweeted=false
            rtImageView.image=#imageLiteral(resourceName: "retweet-icon")
            retweetLabel.text=String(tweet.retweetCount)
        }
        else{
            tweet.retweetCount+=1
            tweet.retweeted=true
            rtImageView.image=#imageLiteral(resourceName: "retweet-icon-green")
            retweetLabel.text=String(tweet.retweetCount)
        }
    }
    
    
    @IBAction func likeAction(_ sender: Any) {
        if(tweet.favorited)!{
            tweet.favoriteCount=tweet.favoriteCount!-1
            tweet.favorited=false
            favImageView.image=#imageLiteral(resourceName: "favor-icon")
            likeLabel.text=String(tweet.favoriteCount!)
        }
        else{
            tweet.favoriteCount=tweet.favoriteCount!+1
            tweet.favorited=true
            favImageView.image=#imageLiteral(resourceName: "favor-icon-red")
            likeLabel.text=String(tweet.favoriteCount!)
        }
    }
    
    var tweet: Tweet! {
        didSet {
            tweetTextLabel.text = tweet.text
            usernameLabel.text="@"+tweet.user.nickname
            nicknameLabel.text=tweet.user.name
            retweetLabel.text=String(tweet.retweetCount)
            likeLabel.text=String(tweet.favoriteCount!)
            profileImageView.af_setImage(withURL: tweet.user.imageURL)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
