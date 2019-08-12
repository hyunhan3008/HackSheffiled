require "unicode/emoji"
v_happy =  "😍 😘 😅 😀 😃 😁 😆".split(" ")
happy ="🤣 😂 ☺️ 😇 🙃 😉 😌 😗 😙 😚 😋 😜 😝 😛 🤑 🤗 🤓 😎 😅 😆 😀 😃"
sad = "😒 😞 😔 😟 😕 🙁 ☹️ 😒 😞 😔 😟 😕 🙁 ☹️"
v_sad =  "😨 😰 😢 😥 🤤 😭 😓 😪 💔"
angry = "😤 😠 😡 😶 😐 😑" 
string =" and and and fdgbfd "
something = string.scan(Unicode::Emoji::REGEX)
puts something
# v_happy.each do |face|
#     if face.match(emo_regex)
#         count = count+1
#     end
# end

hello = Array.new
puts "sdfg #{hello.length()}"
        
        























#v_happy_array = v_happy.split(" ")
# v_happy.each do |mood|
#     puts mood
# end
#   if tweet.text.include? "" or tweet.text.include? "" or tweet.text.include? ""    😁then
#             happy_rating = happy_rating + 10   
#         end
#         if tweet.text.include? "😄" or tweet.text.include? "😃" or tweet.text.include? "🙂" or tweet.text.include? "😊" 
#             or tweet.text.include? ""
#             happy_rating = happy_rating + 10😆
#         end
    
#         if tweet.text.include? "" or tweet.text.include? "🙁" or tweet.text.include? "☹️" or tweet.text.include? "😒" or tweet.text.include? "😞" or tweet.text.include? "😔"
#             sad_rating = sad_rating + 10 
#         end
#         if tweet.text.include? "😣" or tweet.text.include? "😓" or tweet.text.include? "☹️" or tweet.text.include? "" or tweet.text.include? "😩" or
#             tweet.text.include? "tragedy" or tweet.text.include? "distressed" or tweet.text.include? "sad" or tweet.text.include? "upset" or
#            	tweet.text.include? "unhappy" or tweet.text.include? "heartbroken" or tweet.text.include? "hurt"
#             sad_rating = sad_rating + 20
#         end
#         if tweet.text.include? "😣" or tweet.text.include? "😡" or tweet.text.include? "😠" or tweet.text.include? "pissed off" or tweet.text.include? "fuming" or
#             tweet.text.include? "angry" or tweet.text.include? "angry" or tweet.text.include? "annoyed"
#             angry_rating = angry_rating + 50 😨 😰 😢 😥 🤤 😭 😓 😪
#         end 