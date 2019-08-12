require 'twitter'
require "unicode/emoji"

config = {
:consumer_key => "OmAG9pDk2QBnex8DGTrBQGjb9",
:consumer_secret => "okZZ6ZqMIewb6Paw6T6i9EUzKW29Vz1CjQSwngLZhWNhf1jXxg",
:access_token => "2308047525-52RuiuTNEFN6KplVEHbrrljAMVcXYiZJKuljntz",
:access_token_secret => "ktkgoMgrjTtvqm1rvStSsT15aYyRcIoklFV1XMFO58LYx"
}

$client = Twitter::REST::Client.new(config)


#☹️😩😄😠😁😆😓😐💔😭😀😃😄😄😆😊☺️🤣😂😅🙂😋😕🙁☹️😒😞😔😣😡

#user = $client.user("lawrenceschobs")
#tweets = client.user_timeline("lawrenceschobs", {:count => 100})
#tweets = $client.search("and", {:coordinates => "51.509865, -0.118092, 10mi"}).take(1)
happy_rating = 0
sad_rating = 0
angry_rating = 0


def tweet_finder (num_tweets, client, long, lat)
    tweets = Array.new
    while tweets.length() < num_tweets
        temp_tweets = client.search("and", {:coordinates => "#{long}, #{lat}, 10mi"}).take(50)
        temp_tweets.each do |tweet|
            if tweet.text.scan(Unicode::Emoji::REGEX).any?
                tweets.push(tweet)
            end 
        end
    end
    return tweets
end
        
    
    
    
    
    
def mood_analyser(moods)
    puts "now mood_analyser"
    happy_rating = moods[0]
    sad_rating = -(moods[1])
    angry_rating = moods[2]
    puts "blah blah"
    rating = happy_rating + sad_rating
    if angry_rating > happy_rating and angry_rating > -(sad_rating) or
        (angry_rating + sad_rating) > (happy_rating*1.25)
        puts "ANGRY!"
        return 4
    elsif rating >= -50 and rating <= 50
         puts "NEUTRAL"
        return 2     
    elsif rating > 50
        puts "HAPPY!"
        return 1
    else 
        puts "sad :("
        return 3
    end
end

v_happy =  "😍 😘 😅 😀 😃 😁 😆".split(" ")
happy ="🤣 😂 ☺️ 😇 🙃 😉 😌 😗 😙 😚 😋 😜 😝 👌 😛 🤑 🤗 🤓 😎 ❣️ 💕 💞 💓 💗 💖 💘  ❤️ 💛 💚 💙 💜 🖤🙌 👍 😅 😆 😀 😃 🤡 🤠 😏".split(" ")
sad = "😒 😞 😔 😟 😕 🙁 ☹️ 😒 👎 😞 😔 😟 😕 🙁 ☹️ 😣 😖 😫 😩 🤢 ".split(" ")
v_sad =  "😨 😰 😢 😥 🤤 😭 😓 😪 💔".split(" ") 
angry = "😤 😠 😡 😶 😐 😑 😱 🙄 🤧 🖕".split(" ") 
$emojies = [v_happy,happy, sad, v_sad, angry]

def tweet_analyser(tweets, emojies)
    happy_rating = 0
    sad_rating = 0
    angry_rating = 0
    v_happy = emojies[0]
    happy = emojies[1]
    sad = emojies[2]
    v_sad = emojies[3]
    angry = emojies[4]
    
    tweets.each do |tweet|
        v_happy.each do |face|
            if tweet.text.include? "#{face}"
                happy_rating = happy_rating + 10  
            end
        end
        happy.each do |face|
            if tweet.text.include? "#{face}"
                happy_rating = happy_rating + 7  
            end
        end
        sad.each do |face|
            if tweet.text.include? "#{face}"
                sad_rating = sad_rating + 10  
            end
        end
         v_sad.each do |face|
            if tweet.text.include? "#{face}"
                sad_rating = sad_rating + 20  
            end
        end
        angry.each do |face|
            if tweet.text.include? "#{face}"
                angry_rating = angry_rating + 40  
            end
        end
    end
    puts "twitter analyser"
    puts happy_rating
    puts sad_rating
    puts angry_rating
    return [happy_rating, sad_rating, angry_rating]
end

def twitter_loop (client, long, lat, num_tweets)   
    new_tweets = tweet_finder(num_tweets, client, long, lat)
    if (new_tweets.any?)
        moods = tweet_analyser(new_tweets, $emojies)
        overalls = mood_analyser(moods)
    end
    return overalls
end

#twitter_loop($client, 51.509865, -0.118092, 200)   
#
#tweets = tweet_finder(300, $client)    
#moods = tweet_analyser(tweets, emojies)
#puts moods.length
#overalls = mood_analyser(moods)
# london = 51.509865, -0.118092
#puts happy_rating
#puts sad_rating
#puts angry_rating
#happy = 1, neutral = 2, sad =3, angry =4


        

    