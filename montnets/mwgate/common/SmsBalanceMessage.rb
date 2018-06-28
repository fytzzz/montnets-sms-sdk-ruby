# **********************************************************************
#
# Description: 查询余额接口类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
class  SmsBalanceMessage < SmsBaseMessage

  def initialize()
    super("get_balance")
  end

  def makeupRet(errorCode)
    ret = {
        'result' => errorCode,
        'chargetype'=> '0',
        'balance' => '0',
        'money' => '0'
    }
    JSON.generate(ret)
  end

  def toJson
    timestamp = Time.now.strftime("%m%d%H%M%S") # MMDDHHMMSS
    md5pwd = self.md5pwd(timestamp)

    payload = {
        :userid => self.userid.upcase,
        :pwd=> md5pwd,
        :timestamp => timestamp
    }
    body = JSON.generate(payload)
    return body
  end

end