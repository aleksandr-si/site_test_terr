# site_test_terr
Before running script you should to fill in spaces:
- bot = telebot.TeleBot('')
- ch_id=''
in bash and python scripts
and 
- access_key
- secret_key
in terr config files
Then start main.py from main_serv and you could run your tests!

###############################################################

PS
in bot you should enter token from botfather
in ch_id - your channel id, you could find it out by request:
chat id - send curl -v to https://api.telegram.org/bot<YourBOTToken>/getUpdates 
Dont forget to init terr folder!
