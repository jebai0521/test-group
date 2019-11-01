//
//  ViewController.m
//  ShopifyCookie2
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
    NSURL* url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"];

    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"]]];
////
    WKHTTPCookieStore* store = _webView.configuration.websiteDataStore.httpCookieStore;
    
//    [store getAllCookies:^(NSArray<NSHTTPCookie *> * cookies) {
//        for (NSHTTPCookie* cookie in cookies) {
//
//
//            [store deleteCookie:cookie completionHandler:^{
//                NSLog(@"456");
//            }];
////            NSLog(@"======================================================");
////            NSLog(@"propertiesm %@", cookie.properties);
////            NSLog(@"name %@", cookie.name);
////            NSLog(@"value %@", cookie.value);
////            NSLog(@"expiresDate %@", [cookie.expiresDate descriptionWithLocale:nil]);
////            NSLog(@"domain %@", cookie.domain);
////            NSLog(@"path %@", cookie.path);
////            NSLog(@"sessionOnly %@", cookie.sessionOnly ? @"YES" : @"NO");
////            NSLog(@"version %lu", (unsigned long)cookie.version);
//        }
//    }];
    
//    [self writeCookies:store];
}

- (void) writeCookies:(WKHTTPCookieStore*) store
{
    NSArray* cookies = @[
        @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_shopify_y",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"347f7899-0fd1-4408-8944-d6dbaec90970",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997485),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-31 09:31:25 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"_orig_referrer",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997485),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-31 09:31:25 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"_landing_page",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"%2F",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2039-10-17 10:56:14 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"secure_customer_sig",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieSecure : @(YES),
            NSHTTPCookieValue : @"c70665a2c7b97a0596e3c2695d73b5ae",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-31 10:56:14 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"cart_sig",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_y",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"347f7899-0fd1-4408-8944-d6dbaec90970",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_s",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"d90ec198-7310-4B07-E6BB-BB5629F9C4F6",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_s",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"d90ec198-7310-4B07-E6BB-BB5629F9C4F6",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_shopify_fs",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"2019-10-17T09%3A31%3A25.370Z",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_sa_t",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"2019-10-17T10%3A56%3A15.349Z",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_sa_p",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997498),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-18 09:31:38 +0000",
            NSHTTPCookieName : @"passwordless_login",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @(1),
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997498),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-18 09:31:38 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"csrf",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieSecure : @(YES),
            NSHTTPCookieValue : @(1),
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997498),
            NSHTTPCookieDomain : @"pstore-kimi.myshopify.com",
            NSHTTPCookieExpires : @"2019-10-18 09:31:38 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"_secure_session_id",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieSecure : @(YES),
            NSHTTPCookieValue : @"16226bd1da9bdad67f7530ee0069b76d",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(592997485),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2020-10-16 09:31:24 +0000",
            @"HttpOnly" : @(YES),
            NSHTTPCookieName : @"__cfduid",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"de0eec528a799590c91200b9b48af970b1571304684",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_y",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"347f7899-0fd1-4408-8944-d6dbaec90970",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_shopify_y",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"347f7899-0fd1-4408-8944-d6dbaec90970",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_s",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"d90ec198-7310-4B07-E6BB-BB5629F9C4F6",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_s",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"d90ec198-7310-4B07-E6BB-BB5629F9C4F6",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2021-10-06 10:56:15 +0000",
            NSHTTPCookieName : @"_shopify_fs",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"2019-10-17T09%3A31%3A25.370Z",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_sa_t",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"2019-10-17T10%3A56%3A15.349Z",
            NSHTTPCookieVersion : @(1),
        },
         @{
            @"Created" : @(593002575),
            NSHTTPCookieDomain : @".myshopify.com",
            NSHTTPCookieExpires : @"2019-10-17 11:26:15 +0000",
            NSHTTPCookieName : @"_shopify_sa_p",
            NSHTTPCookiePath : @"/",
            NSHTTPCookieValue : @"",
            NSHTTPCookieVersion : @(1),
            NSHTTPCookieOriginURL : @""
        }
    ];
    
    for (NSDictionary* properties in cookies) {
        NSLog(@"properties %@", properties);
        
        [store setCookie:[NSHTTPCookie cookieWithProperties:properties] completionHandler:^{
            NSLog(@"123");
        }];
    }
}


@end
