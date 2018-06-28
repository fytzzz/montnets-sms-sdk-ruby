# **********************************************************************
#
# Description: 接口类父类
#
# Author: fangyt
#
# Created Date:2018/6/25
#
# Copyright (c) ShenZhen Montnets Technology, Inc. All rights reserved.
#
# **********************************************************************
class SmsTextMessage < SmsBaseMessage
    attr_accessor :content,:timestamp,:svrtype,:exno,:custid,:exdata
    def initialize(apiname)
        super(apiname)
    end
end