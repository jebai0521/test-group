//
//  ViewController.m
//  ShopifyCookie3
//
//  Created by Ming Chen on 17/10/19.
//  Copyright © 2019 Ming Chen. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)visitStore:(id)sender {
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"];

    // 2.通过请求路径(url)创建请求对象(request)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    // 3.向服务器发送同步请求(data)
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // sendSynchronousRequest阻塞式的方法，等待服务器返回数据

    // 4.解析服务器返回的数据(解析成字符串)
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"string %@",string);
}

- (IBAction)rewriteCookies:(id)sender {
    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    WKHTTPCookieStore* store = _webView.configuration.websiteDataStore.httpCookieStore;
     for (NSHTTPCookie* cookie in [storage cookies]) {
         NSLog(@"======================================================");
         NSLog(@"properties %@", cookie.properties);
         [store setCookie:cookie completionHandler:^{
             NSLog(@"write complete");
         }];
     }
}

- (IBAction)openWebView:(id)sender {
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"]]];
}

- (IBAction)doLogin:(id)sender {
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/account/login"];

    // 2.通过请求路径(url)创建请求对象(request)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    request.HTTPShouldHandleCookies = YES;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    request.HTTPBody = [@"{\"customer\":{\"email\":\"mingchen@163.com\",\"password\":\"123456\"}}" dataUsingEncoding:NSUTF8StringEncoding];

    // 3.向服务器发送同步请求(data)
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // sendSynchronousRequest阻塞式的方法，等待服务器返回数据

    // 4.解析服务器返回的数据(解析成字符串)
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"string %@",string);
}

- (IBAction)viewCookies:(id)sender {
        NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
        for (NSHTTPCookie* cookie in [storage cookies]) {
                        NSLog(@"======================================================");
            //            NSLog(@"version %lu", (unsigned long)cookie.version);
            //            NSLog(@"name %@", cookie.name);
            //            NSLog(@"value %@", cookie.value);
            //            NSLog(@"expiresDate %@", [cookie.expiresDate descriptionWithLocale:nil]);
            //            NSLog(@"sessionOnly %@", cookie.sessionOnly ? @"YES" : @"NO");
            //            NSLog(@"domain %@", cookie.domain);
            //            NSLog(@"path %@", cookie.path);
            //            NSLog(@"secure %@", cookie.secure ? @"YES" : @"NO");
            //            NSLog(@"isHTTPOnly %@", cookie.isHTTPOnly ? @"YES" : @"NO");
            //            NSLog(@"comment %@", cookie.comment);
            //            NSLog(@"commentURL %@", cookie.commentURL);
            //            NSLog(@"portList %@", cookie.portList);
            //            NSLog(@"sameSitePolicy %@", cookie.sameSitePolicy);
                        NSLog(@"properties %@", cookie.properties);
        }
}

- (IBAction)cleanCookies:(id)sender {

    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    

    for (NSHTTPCookie* cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
}

@end
