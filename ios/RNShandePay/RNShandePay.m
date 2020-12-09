
#import "RNShandePay.h"
#import "RSAUtil.h"
#import <PayFramework/PySdkViewController.h>
#import "WXApi.h"
#import "AFNetworking.h"
#import "UPPaymentControl.h"
#import <Security/Security.h>
#import <CommonCrypto/CommonDigest.h>
@import WebKit;

@implementation RNShandePay

RCT_EXPORT_MODULE()

- (instancetype)init
{
    self = [super init];
    return self;
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}


RCT_EXPORT_METHOD(wechatPay){
    NSDate *date = [NSDate date];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYYMMddhhmmss"];
    NSString *DateTime = [formatter stringFromDate:date];
    NSLog(@"%@============年-月-日  时：分：秒",DateTime);
    int a = arc4random() % 100000;
    int b = arc4random() % 100000;
    NSString *str = [NSString stringWithFormat:@"%06d%06d", a,b];
    NSString * timeStr = [NSString stringWithFormat:@"%@%@",DateTime,str];



    NSDictionary * dic = @{
     @"version":@"10",
     @"mer_no":@"16938552",
     @"mer_order_no":timeStr,
     @"create_ip":@"172_12_12_2",
     @"store_id":@"100001",
     @"goods_name":@"测试商品",
     @"pay_extra":@"{\"mer_app_id\":\"212122\",\"gh_ori_id\":\"gh_8f69bbed2867\",\"path_url\":\"pages/zf/index?\",\"miniProgramType\":\"2\",\"wx_app_id\":\"wx24932e45899137eb\"}",
     @"create_time":DateTime,
     @"mer_key":@"Xx52CDtWRH1etGu4IfFEB4OeRrnbr+EUd5VO7cBQFCqxfDl5FJcJaUjKJbHapVsyxSODBEbssNk=",
      @"clear_cycle":@"0",
     @"expire_time":@"",
     @"notify_url":@"https://baidu.com.cn/notify_test/sand",
     @"product_code":@"02010005",
     @"accsplit_flag":@"NO",
     @"return_url":@"",
     @"order_amt":@"0.01",
     @"sign":@"B78162FFB43030BC1F8E2BAEB92DFDB2",
     @"sign_type":@"MD5",
     @"meta_option":@"[{\"sc\":\"wzsc://\",\"s\":\"iOS\",\"id\":\"com.pay.paytypetest\",\"n\":\"testapp\"}]"
    };

    PySdkViewController * pay = [[PySdkViewController alloc]init];

    pay.PayfailureBlock = ^(NSString * str){
          NSLog(@"调取微信支付结果%@",str);

      };
    pay.tokenIDBlock = ^(NSString * str ){
        NSLog(@"调取微信支付获取tokenid：%@",str);

        //存储token_id字段，用来调取查询支付结果的接口。
       NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setObject:str forKey:@"wxtoken_id"];

            NSString * allPath = [NSString stringWithFormat:@"pages/zf/index?token_id=%@",str];
            WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
            launchMiniProgramReq.userName = @"gh_8f69bbed2867";
            launchMiniProgramReq.path = allPath;
            launchMiniProgramReq.miniProgramType = 2; //拉起小程序的类型
            [WXApi sendReq:launchMiniProgramReq completion:nil];


        };

    [pay weixin:dic];
    [self presentViewController:pay animated:YES completion:nil];
}

@end
  
