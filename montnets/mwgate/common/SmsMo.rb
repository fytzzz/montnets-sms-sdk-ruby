# **********************************************************************
#
# Description: 获取上行接口类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
class SmsMo < SmsBaseMessage
    attr_accessor :retsize
    def initialize()
      super("get_mo")
      @retsize = 100
    end

    def setRetsize(resize)
      #每次请求想要获取的上行最大条数。最大200,超过200按200返回。小于等于0或不填时，系统返回默认条数，默认100条
      if(!resize.nil?)
        @resize = resize
        if(@resize > 200)
          @resize = 200
        elsif @resize <=0
          @resize = 100
        end
      end
    end

    # 根据错误码构造返回值
    def makeupRet(errorCode)
      ret = {
          'result' => errorCode,
          'mos'=> []
      }
      JSON.generate(ret)
    end

    def toJson()
      timestamp = Time.now.strftime("%m%d%H%M%S") # MMDDHHMMSS
      md5pwd = self.md5pwd(timestamp)

      payload = {
          :userid => self.userid.upcase,
          :pwd => md5pwd,
          :timestamp => timestamp,
          :retsize => self.retsize
      }
      body = JSON.generate(payload)
      return body
    end
end