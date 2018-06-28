# **********************************************************************
#
# Description: 单条发送接口类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
require 'json'
class SmsSingleMessage < SmsTextMessage
  attr_accessor :mobile

  def initialize()
      super("single_send")
  end

  def makeupRet(errorCode)
      ret = {
          'result' => errorCode,
          'msgid'=> '0',
          'custid' => ''
      }
      JSON.generate(ret)
  end

  def toJson()
    timestamp = Time.now.strftime("%m%d%H%M%S") # MMDDHHMMSS
    md5pwd = self.md5pwd(timestamp)
    gbkcontent = self.content2gbk(self.content.strip())

    payload = {
        :userid => self.userid.upcase,
        :pwd=> md5pwd,
        :mobile => self.mobile,
        :content => gbkcontent,
        :timestamp => timestamp,
        :svrtype => self.svrtype,
        :exno => self.exno,
        :custid => self.custid,
        :exdata => self.exdata
    }
    body = JSON.generate(payload)
    return body
  end
end