# **********************************************************************
#
# Description: 个性化群发接口类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
require 'json'
class  SmsMultiMessage < SmsBaseMessage
  attr_accessor :multimts
  def initialize()
    super("multi_send")
    @multimts = Array.new
  end

  def addReciver(mobile,content,svrtype,exno,custid,exdata)
      item = [mobile,content,svrtype,exno,custid,exdata]
      @multimts << item
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

    payload = {
        :userid => self.userid.upcase,
        :pwd=> md5pwd,
        :timestamp => timestamp
    }

    multimt = []
    for item in @multimts do
      mobile = item[0]
      content = item[1]
      svrtype = item[2]
      exno = item[3]
      custid = item[4]
      exdata = item[5]
      gbkcontent = self.content2gbk(content.strip())
      reciever = {
          :mobile => mobile,
          :content => gbkcontent,
          :svrtype => svrtype,
          :exno => exno,
          :custid => custid,
          :exdata => exdata
      }
      multimt <<  reciever
    end

    payload[:multimt] = multimt
    body = JSON.generate(payload)
    return body
  end
end