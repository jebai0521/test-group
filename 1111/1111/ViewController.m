//
//  ViewController.m
//  1111
//
//  Created by Ming Chen on 23/11/19.
//  Copyright © 2019 Ming Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"Detected docs path: %@", NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSAllDomainsMask, YES));
    
    NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:[@"Library/Private Documents" stringByAppendingPathComponent: @"db_2.3"]];
    
    NSLog(@"Detected docs path: %@", dbPath);
}


@end
