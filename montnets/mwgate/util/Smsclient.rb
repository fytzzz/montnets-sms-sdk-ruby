require 'uri'
require 'net/http'
require 'json'
require 'yaml'
class Smsclient
      attr_accessor :userid,:pwd,:url
      @@smsconfig = nil
      def initialize()
        if(@@smsconfig.nil?)
          @@smsconfig = YAML.load(File.open(File.dirname(__FILE__) + "/../../../montnets-sms.yml"))
        end
        @userid = @@smsconfig["userid"]
        @pwd  = @@smsconfig["pwd"]
        @url = @@smsconfig["url"]
      end

      def postSmsMessage(message)
        fullurl = self.url + message.apiname
        url = URI.parse(fullurl)
        req = Net::HTTP::Post.new(url.path,{'Content-Type' => 'application/json'})
        req.body = message.toJson
        res = Net::HTTP.new(url.host,url.port).start{|http| http.request(req)}
        if res.code_type != Net::HTTPOK
          p message.makeupRet(res.code_type.to_s)
        end

        rTest = JSON.parse(res.body)
        return rTest
      rescue Exception => ex
        raise ex
      end

      # 单条发送(短信)
      def singleSend()
          message = SmsSingleMessage.new
          #发送者帐号
          message.userid = self.userid
          #密码
          message.pwd = self.pwd
          #接收方手机号码
          message.mobile = '17620416585'
          #验证码数字<=6位
          message.content = '验证码：6666，打死都不要告诉别人哦！'
          #业务类型：最大可支持10个长度的ASCII字符串：字母，数字
          message.svrtype = '0123456789'
          #扩展号：长度不能超过6位，注意通道号+扩展号的总长度不能超过20位，若超出exno无效，如不需要扩展号则不用提交此字段或填空
          message.exno = '123456'
          #用户自定义流水编号：该条短信在您业务系统内的ID，比如订单号或者短信发送记录的流水号。填写后发送状态返回值内将包含这个ID。
          #最大可支持64位的ASCII字符串：字母、数字、下划线、减号，如不需要则不用提交此字段或填空
          message.custid = 'b3d0a2783d31b21b8573'
          #业务类型：最大可支持10个长度的ASCII字符串：字母，数字
          message.exdata = '0123456789'

        ret = self.postSmsMessage(message)
        p 'singleSend:', ret
      end

      def batchSend()
        message = SmsBatchMessage.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd
        #接收者的手机号码,多个号码用英文逗号隔开
        message.mobiles = '15220289885,17620416585'
        #验证码数字<=6位
        message.content = '验证码：6666，打死都不要告诉别人哦！'
        #业务类型：最大可支持10个长度的ASCII字符串：字母，数字
        message.svrtype = '0123456789'
        #扩展号：长度不能超过6位，注意通道号+扩展号的总长度不能超过20位，若超出exno无效，如不需要扩展号则不用提交此字段或填空
        message.exno = '123456'
        #用户自定义流水编号：该条短信在您业务系统内的ID，比如订单号或者短信发送记录的流水号。填写后发送状态返回值内将包含这个ID。
        #最大可支持64位的ASCII字符串：字母、数字、下划线、减号，如不需要则不用提交此字段或填空
        message.custid = 'b3d0a2783d31b21b8573'
        #业务类型：最大可支持10个长度的ASCII字符串：字母，数字
        message.exdata = '0123456789'

        ret = self.postSmsMessage(message)
        p 'batchSend:', ret
      end

      # 个性化群发(短信)
      def multiSend()
        message = SmsMultiMessage.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd
        #增加2个不同短信内容人接收者
        mobile = '15220289885'
        #验证码数字<=6位
        content = '验证码：6666，打死都不要告诉别人哦！'
        svrtype = '0123456789'
        exno = '123456'
        custid = 'b3d0a2783d31b21b8573'
        exdata = '0123456789'
        message.addReciver(mobile, content, svrtype, exno, custid, exdata) #第1位接收者

        mobile = '17620416585'
        verificationCode = Time.now.strftime("%H%M%S")
        content = '您的验证码为' +  verificationCode + '，请于1分钟内正确输入，如非本人操作，请忽略此短信。'
        message.addReciver(mobile, content, svrtype, exno, custid, exdata) #第2位接收者

        ret = self.postSmsMessage(message)
        print 'multiSend:', ret
    end

      # 获取上行(短信)
      def getMo()
        message = SmsMo.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd
        message.retsize = 100 # 最大值填200

        ret = self.postSmsMessage(message)
        p ret
      end


      # 获取状态报告(短信)
      def getRpt()
        message = SmsRpt.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd
        message.retsize = 500 # 最大值填500

        ret = self.postSmsMessage(message)
        p 'getRpt:', ret
      end

      def getBalance()
        message = SmsBalanceMessage.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd

        ret = self.postSmsMessage(message)
        p 'getBalance:', ret
      end

      def getRemain()
        message = SmsBalanceMessage.new
        #发送者帐号
        message.userid = self.userid
        #密码
        message.pwd = self.pwd

        ret = self.postSmsMessage(message)
        p 'getBalance:', ret
      end
end