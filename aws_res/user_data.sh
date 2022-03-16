#!/bin/bash
yum -y update
pip3 install pytelegrambotapi --upgrade

echo "
import telebot
import subprocess
import sys

bot = telebot.TeleBot('')
ch_id=''
result=str(subprocess.check_output(f' ping -c 10 -n {sys.argv[1]} ',shell=True)).split('\\\n')
fin_res=f'Start tests from server in ${current_zone}-${City}'+'\n'+f'{result[0]}'+'\n'+f'{result[-3]}'+'\n'+f'{result[-2]}'
bot.send_message(ch_id,fin_res) 
" > python_scr.py
python3 python_scr.py ipwichyouwhanttofind