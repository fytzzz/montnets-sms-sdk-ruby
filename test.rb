$:.unshift(File.dirname(__FILE__)+"/montnets/mwgate/common/")
$:.unshift(File.dirname(__FILE__)+"/montnets/mwgate/util/")

require "Message"
require "SmsErrorCode"
require "SmsBaseMessage"
require "SmsTextMessage"
require "SmsSingleMessage"
require "SmsBatchMessage"
require "SmsBalanceMessage"
require "SmsMultiMessage"
require "SmsMo"
require "SmsRpt"
require "Smsclient"

def menu()
    puts "usage:
    1: singleSend
    2: batchSend
    3: multiSend
    4: getMo
    5: getRpt
    6: getBalance
    7: getRemain
    x: exit
    ?: help

    IMPORTANT:
        If you wish the other pepole are able to recieve call or text,
        Please change mobile(s) into their phone number by editting 'smsclient.rb'
    "
end

smsclient = Smsclient.new
menu()
c = nil
while c !='x'
    begin
      STDOUT.flush
      puts "Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:"
      c = gets.chomp.to_s
      if c == '1'
          # 请求提交短信(上行)
          smsclient.singleSend
      elsif c == '2'
          # 相同内容群发(短信)
          smsclient.batchSend
      elsif c == '3'
          # 个性化群发(短信)
          smsclient.multiSend
      elsif c == '4'
          # 获取上行(短信)
          smsclient.getMo
      elsif  c == '5'
          # 获取状态报告(短信)
          smsclient.getRpt
      elsif c == '6'
          # 查询剩余条数
          smsclient.getBalance
      elsif c == '7'
          # 查询剩余金额或条数
          smsclient.getRemain
      elsif c == 'x'
          exit # Nothing to do
      elsif c == '?'
          menu()
      else
          p "unknown command `" + c + "'"
          menu()
      end
    rescue Exception => ex
      puts ex.message
    end
end



