//
//  ViewController.m
//  ShopifyCookie
//
//  Created by Ming Chen on 17/10/19.
//  Copyright © 2019 Ming Chen. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

//IBOutlet @property (strong, nonnull, nonatomic) WKWebView* webView;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSURL* url = [NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"];
    
//    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://pstore-kimi.myshopify.com/"]]];
    
//    NSHTTPCookieStorage* storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    for (NSHTTPCookie* cookie in [storage cookiesForURL:url]) {
//        NSLog(@"propertiesm %@", cookie.properties);
//        NSLog(@"name %@", cookie.name);
//        NSLog(@"name %@", cookie.value);
//        NSLog(@"expiresDate %@", [cookie.expiresDate descriptionWithLocale:nil]);
//        NSLog(@"domain %@", cookie.domain);
//        NSLog(@"path %@", cookie.path);
//        NSLog(@"name %d", cookie.sessionOnly);
//        NSLog(@"version %lu", (unsigned long)cookie.version);
//    }

    
    WKHTTPCookieStore* store = _webView.configuration.websiteDataStore.httpCookieStore;
    
    [store getAllCookies:^(NSArray<NSHTTPCookie *> * cookies) {
        for (NSHTTPCookie* cookie in cookies) {
//            NSLog(@"======================================================");
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
    }];
}


@end
