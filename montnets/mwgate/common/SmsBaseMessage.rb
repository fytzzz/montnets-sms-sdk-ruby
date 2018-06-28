# **********************************************************************
#
# Description: 接口类基类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
require 'digest'
class SmsBaseMessage
  attr_accessor :fullurl,:userid,:pwd,:apiname

  def initialize(api_ame)
       @apiname = api_ame
  end

  def md5pwd(timestamp)
    tempPwd = @userid.upcase + '00000000' + @pwd + timestamp
    Digest::MD5.hexdigest(tempPwd.encode('utf-8'))
  end

  def content2gbk(content)
    # gdb编码短信业务内容
    URI::encode(content.encode('gbk'))
  end

  def toJson
  end

  def makeupRet(errorCode)
  end
end