//
//  testViewViewController5.m
//  testviews
//
//  Created by William on 13-6-2.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewViewController5.h"

@interface testViewViewController5(){
    
    //    NSTimer * timer;
    NSTimer * nsTimer;
    float timeInterval;
    BOOL forTimerBool;
    UISlider * slider;
    UILabel * label;
#pragma mark  $ UIWebView
    UILabel * myloadingaLabel;
    UIWebView * myWebView;
#pragma mark $ UIScrollView
    
#pragma mark $ UIAlertView
    UIAlertView * alert;
#pragma mark $ UIControl
    UIActivityIndicatorView * spinner;
    UIProgressView * progressView ;
    float progress;
}
@end

@implementation testViewViewController5

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //    [self.window setAlpha:0.5];
    // Override point for customization after application launch.
    //    self.window.backgroundColor = [UIColor redColor];
#pragma mark  $ Hello World
    //    UIViewController * myViewController = [[UIViewController alloc]initWithNibName:nil bundle:nil];
    //    UILabel * myLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    //    myLabel.text = @"Hello, World!";
    //    [myLabel sizeToFit];
    //    [myViewController.view addSubview:myLabel];
    //    [self.window addSubview:myViewController.view];
    
    
#pragma mark  $ UIWebView
    
    CGRect frame = CGRectMake(0, 200, 320, 40);
    myloadingaLabel = [[UILabel alloc]initWithFrame:frame];
    myloadingaLabel.text = @"loading...";
    myloadingaLabel.hidden = YES;
    [self.view addSubview:myloadingaLabel];

    frame = CGRectMake(0, 20, 320,self.view.frame.size.height-20);
    myWebView = [[UIWebView alloc]initWithFrame:frame];
    NSURL * homeUrl = [NSURL URLWithString:@"http://www.baidu.com/"];//http://food.chengmi.com/search?guide_name=
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:homeUrl];
    [myWebView setDelegate:self];
    [myWebView loadRequest:request];
    
}

#pragma mark  $ UIWebView
-(void)webViewDidStartLoad:(UIWebView *)webView{
    myloadingaLabel.hidden = NO;
    UIApplication * application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    myloadingaLabel.hidden = YES;
    UIApplication * application = [UIApplication sharedApplication];
    application.networkActivityIndicatorVisible = NO;
    [self.view addSubview:webView];
}


#pragma mark $ UIControl//UIActivityIndicatorView2
//    if (spinner.isAnimating) {
//        [spinner stopAnimating];
//    }else [spinner startAnimating];
//}

@end
