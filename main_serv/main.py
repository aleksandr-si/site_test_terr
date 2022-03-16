import telebot
import datetime
import subprocess
import re
import time


bot = telebot.TeleBot('')
@bot.message_handler(commands=["start"])
def start(m, res=False):
    bot.send_message(m.chat.id, 'Ready to serv! Write ip wich you want to check)')

@bot.message_handler(content_types=["text"])
def handle_text(message):
    ip_add = message.text
    try:
        re.search(".*",ip_add)
    except:
        bot.send_message(message.chat.id, f'incorrect ip! {ip_add}')
    else:
        bot.send_message(message.chat.id, f'I\'ll got it! \n Start tests to {ip_add}!')
        process_1=subprocess.Popen([f"./bash_scr.sh", f"{ip_add}"])
        bot.send_message(message.chat.id, f'!!!DONT SEND ANYTHING TO CHAT TILL THE MESSAGE END OF TESTS!!!')
    time.sleep(120)

bot.polling(none_stop=True, interval=0)
