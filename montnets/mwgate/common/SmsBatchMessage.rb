# **********************************************************************
#
# Description: 相同内容群发接口类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
require 'json'
class  SmsBatchMessage < SmsTextMessage
  attr_accessor :mobiles

  def initialize()
    super("batch_send")
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
        :mobile => self.mobiles,
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