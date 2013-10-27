//
//  testViewViewController6.m
//  testviews
//
//  Created by William on 13-6-2.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewViewController6.h"

@interface testViewViewController6 (){
#pragma mark $ UIAlertView
    UIAlertView * alert;
}

@end

@implementation testViewViewController6

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#pragma mark $ UIScrollView
    CGRect frame = CGRectMake(0, 0, 320, self.view.bounds.size.height);
    int pageCount = 6;
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.contentSize = CGSizeMake(320*pageCount, self.view.bounds.size.height);
    NSLog(@"%f",self.view.bounds.size.height);
    scrollView.pagingEnabled = YES;
    for (int i = 0; i<pageCount; i++) {
        CGRect f = CGRectMake(i*320, 0, 320, self.view.bounds.size.height);
        UIView * v = [[UIView alloc]initWithFrame:f];
        if (i%2) {
            v.backgroundColor = [UIColor whiteColor];
        }else{
            v.backgroundColor = [UIColor lightGrayColor];
        }
        
        UILabel * l = [[UILabel alloc ]initWithFrame:v.bounds];
        l.text = [NSString stringWithFormat:@"View #%d",i+1];
        l.backgroundColor = [UIColor clearColor];
        [v addSubview:l];
        [scrollView addSubview:v];
    }
    [self.view addSubview:scrollView];
}

@end
