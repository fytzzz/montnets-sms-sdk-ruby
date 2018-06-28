# montnets-sms-sdk-ruby
梦网云通讯（短信平台 Ruby 接口）

#使用说明
1.安装ruby，下载地址：http://www.ruby-lang.org/en/
ruby 2.2+
>>ruby -v
>>ruby 2.2.x

2.修改短信发送账号配置montnets-sms.yml
userid: E104XX
pwd:  1V8VXX
url:  http://api01.monyun.cn:7901/sms/v2/std/
备注：如果你想存库，修改Smsclient.rb中smsconfig的获取方式

3.调用发送短信方法
根据实际情况修改Smsclient.rb的方法

4.执行test.rb
montnets-sms-sdk-ruby>ruby test.rb
usage:
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

Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
1
"singleSend:"
{"result"=>0, "msgid"=>7832079989982321833, "custid"=>"b3d0a2783d31b21b8573"}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
2
"batchSend:"
{"result"=>0, "msgid"=>7832080264860228778, "custid"=>"b3d0a2783d31b21b8573"}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
3
multiSend:{"result"=>0, "msgid"=>7832080814616042669, "custid"=>"b3d0a2783d31b21b8573"}Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
4
{"result"=>0, "mos"=>[]}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
5
"getRpt:"
{"result"=>0, "rpts"=>[{"msgid"=>7831514841006699305, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"15220289885", "spno"=>"10690329168906162", "exno"=>"", "stime"=>"2018-06-25 11:50:05", "rtime"=>"2018-06-25 11:50:08", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exd
ata"=>"0123456789"}, {"msgid"=>7831515665637456954, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"17620416585", "spno"=>"10690766408806162", "exno"=>"", "stime"=>"2018-06-25 11:50:08", "rtime"=>"2018-06-25 11:50:18", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdat
a"=>"0123456789"}, {"msgid"=>7831513741494016494, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"17620416585", "spno"=>"10690766408806162", "exno"=>"", "stime"=>"2018-06-25 11:50:01", "rtime"=>"2018-06-25 11:50:20", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"
=>"0123456789"}, {"msgid"=>7831514841006699306, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"17620416585", "spno"=>"10690766408806162", "exno"=>"", "stime"=>"2018-06-25 11:50:05", "rtime"=>"2018-06-25 11:50:22", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"=>
"0123456789"}, {"msgid"=>7832079989982321833, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"17620416585", "spno"=>"10690766408806162", "exno"=>"", "stime"=>"2018-06-25 12:18:13", "rtime"=>"2018-06-25 12:18:17", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"=>"0
123456789"}, {"msgid"=>7832080264860228778, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"15220289885", "spno"=>"10690329168906162", "exno"=>"", "stime"=>"2018-06-25 12:18:14", "rtime"=>"2018-06-25 12:18:18", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"=>"012
3456789"}, {"msgid"=>7832080814616042669, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"15220289885", "spno"=>"10690329168906162", "exno"=>"", "stime"=>"2018-06-25 12:18:16", "rtime"=>"2018-06-25 12:18:18", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"=>"01234
56789"}, {"msgid"=>7831513741494016493, "custid"=>"b3d0a2783d31b21b8573", "pknum"=>1, "pktotal"=>1, "mobile"=>"15220289885", "spno"=>"10690329168906162", "exno"=>"", "stime"=>"2018-06-25 11:50:01", "rtime"=>"2018-06-25 11:50:05", "status"=>0, "errcode"=>"DELIVRD", "errdesc"=>"success", "exdata"=>"0123456
789"}]}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
6
"getBalance:"
{"result"=>0, "chargetype"=>2, "balance"=>0, "money"=>"9.350000"}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
7
"getBalance:"
{"result"=>0, "chargetype"=>2, "balance"=>0, "money"=>"9.200000"}
Please type { 1 | 2 | 3 | 4 | 5 | 6 | 7 | x | ? }:
x
exit
