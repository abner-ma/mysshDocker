#!/usr/bin/python
#-*-coding:UTF-8-*-

import ConfigParser

import smtplib
from email.mime.text import MIMEText

class mailconfig(object):
    user_name = "test@163.com"
    user_pw = "password"
    config_name = "/etc/MYsend.ini"

    def __init__(self,config_name):
        self.config_name = config_name

    def getConfig(self):
        config = ConfigParser.ConfigParser()
        config.readfp(open(self.config_name, "rb"))
        self.user_name = config.get("global", "user_name")
        self.user_pw = config.get("global", "user_pw")

    def get_user_name(self):
        return self.user_name
    
    def get_user_pw(self):
        return self.user_pw

class MYsend(object):
    mailto_list=['9690xxxxx@qq.com',]           #收件人(列表)
    mail_host="smtp.163.com"            #使用的邮箱的smtp服务器地址，这里是163的smtp地址
    user_name="test@163.com"
    user_pw="password"

    def __init__(self,user_name,user_pw):
        self.user_name=user_name
        self.user_pw=user_pw

    def send_mail(self):
        sender="hello"+"<"+self.user_name+">"
        msg = MIMEText("短信测试",_subtype='plain')
        msg['Subject'] = "测试代码"
        msg['From'] = self.user_name
        msg['To'] = ";".join(self.mailto_list)                #将收件人列表以‘；’分隔

        try:
            server = smtplib.SMTP()
            server.connect(self.mail_host)                            #连接服务器
            server.login(self.user_name,self.user_pw)    #登录操作,密码是授权码，而不是邮箱登录密码
            server.sendmail(sender, self.mailto_list, msg.as_string())
            server.close()
            return True
        except Exception, e:
            print str(e)
            return False

if __name__ == "__main__":
    mysendmail_obj = MYsend("usermailname","clientpassword")
    mysendmail_obj.send_mail()
    print "Done!"
#for i in range(1):                             #发送1封，上面的列表是几个人，这个就填几
#    if send_mail(mailto_list,"电话","电话是XXX辅导辅导辅导"):  #邮件主题和邮件内容
#        #这是最好写点中文，如果随便写，可能会被网易当做垃圾邮件退信
#        print "done!"
