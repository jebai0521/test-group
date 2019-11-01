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

{
    WKHTTPCookieStore* store;
    
    NSString* shop;
}

@property (weak, nonatomic) IBOutlet WKWebView *webView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

//        store = _webView.configuration.websiteDataStore.httpCookieStore;
       store = [[WKWebsiteDataStore defaultDataStore] httpCookieStore];
    
    // pstore-kimi.myshopify.com
    // samsonite-sg.myshopify.com
    shop = @"pstore-kimi.myshopify.com";
}


- (IBAction)visitStore:(id)sender {
    // 1.创建请求路径(url)
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@/", shop]];

    // 2.通过请求路径(url)创建请求对象(request)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self request:request];
}

- (IBAction)doLogin:(id)sender {
    // 1.创建请求路径(url)
//    NSURL *url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/account/login"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@/account/login", shop]];

    // 2.通过请求路径(url)创建请求对象(request)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    request.HTTPShouldHandleCookies = YES;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [@" " dataUsingEncoding:NSUTF8StringEncoding];
    
    [self request:request];
}

- (IBAction)doPassword:(id)sender {
    // 1.创建请求路径(url)
//    NSURL *url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/password"];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@/password", shop]];

    // 2.通过请求路径(url)创建请求对象(request)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"post";
    request.HTTPShouldHandleCookies = YES;
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    request.HTTPBody = [@"{\"password\":\"hl88\"}" dataUsingEncoding:NSUTF8StringEncoding];
    
    [self request:request];
}

- (IBAction)viewCookies:(id)sender {
    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie* cookie in [storage cookies]) {
        [self printCookieDetail:cookie source:@"storage" detail:NO];
    }

    [store getAllCookies:^(NSArray<NSHTTPCookie *> * _Nonnull cookies) {
        for (NSHTTPCookie* cookie in cookies) {
            [self printCookieDetail:cookie source:@" store " detail:NO];
        }
    }];
}

- (IBAction)rewriteCookies:(id)sender {
    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    WKHTTPCookieStore* store = _webView.configuration.websiteDataStore.httpCookieStore;
     for (NSHTTPCookie* cookie in [storage cookies]) {
         NSLog(@"======================================================");
         NSLog(@"properties %@", cookie.properties);
         [store setCookie:cookie completionHandler:^{
             NSLog(@"write complete %@", cookie);
         }];
     }
}

- (IBAction)openWebView:(id)sender {
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://%@/", shop]]]];
}

- (IBAction)cleanCookies:(id)sender {

    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    

    for (NSHTTPCookie* cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
    
    [store getAllCookies:^(NSArray<NSHTTPCookie *> * cookies) {
        for (NSHTTPCookie* cookie in cookies) {
            [storage deleteCookie:cookie];
            [store deleteCookie:cookie completionHandler:^{
                NSLog(@"delete complete");
            }];
        }
    }];
}

- (void)request:(NSURLRequest*)request
{
    NSHTTPURLResponse* response;
    NSError* error;
    // 3.向服务器发送同步请求(data)
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // sendSynchronousRequest阻塞式的方法，等待服务器返回数据
    
    NSLog(@"allHeaderFields => %@", [response allHeaderFields]);

    // 4.解析服务器返回的数据(解析成字符串)
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (void)printCookieDetail:(NSHTTPCookie*) cookie source:(NSString*)source detail:(BOOL)detail
{
    NSLog(@"=================  %@  ======================", source);
    if (detail)
    {
        NSLog(@"version %lu", (unsigned long)cookie.version);
        NSLog(@"name %@", cookie.name);
        NSLog(@"value %@", cookie.value);
        NSLog(@"expiresDate %@", [cookie.expiresDate descriptionWithLocale:nil]);
        NSLog(@"sessionOnly %@", cookie.sessionOnly ? @"YES" : @"NO");
        NSLog(@"domain %@", cookie.domain);
        NSLog(@"path %@", cookie.path);
        NSLog(@"secure %@", cookie.secure ? @"YES" : @"NO");
        NSLog(@"isHTTPOnly %@", cookie.isHTTPOnly ? @"YES" : @"NO");
        NSLog(@"comment %@", cookie.comment);
        NSLog(@"commentURL %@", cookie.commentURL);
        NSLog(@"portList %@", cookie.portList);
        NSLog(@"sameSitePolicy %@", cookie.sameSitePolicy);
    }
    
    NSLog(@"%@", cookie.properties);
}

@end
