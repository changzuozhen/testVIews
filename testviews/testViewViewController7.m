//
//  testViewViewController7.m
//  testviews
//
//  Created by William on 13-6-2.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewViewController7.h"

@interface testViewViewController7 (){
        float timeInterval;
    BOOL forTimerBool;
     NSTimer * nsTimer;
    UIActivityIndicatorView * spinner;
    UISlider * slider;
    UILabel * label;
}

@end

@implementation testViewViewController7

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
#pragma mark $ UIControl//UIActivityIndicatorView1
    spinner = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [spinner setCenter:self.view.center];
//    UIView * view = [[UIView alloc]initWithFrame:self.view.bounds];
//    [view addSubview:spinner];
    [self.view addSubview:spinner];
    [spinner startAnimating];
    NSLog(@"%d",[spinner isAnimating]);
    
    
#pragma mark # timer1
    timeInterval = 0.5;
    nsTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(forTimer) userInfo:[NSData data] repeats:YES];
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:nsTimer forMode:NSDefaultRunLoopMode];
    
    slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 100, 320-40, 20)];
    [slider setMaximumValue:2];
    [slider  setMinimumValue:0.01];
    [slider setValue:0.5 animated:YES];
    [slider addTarget:self action:@selector(sliderChanged) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 120, 280, 20)];
    [self.view addSubview:label];

    

//    [self.view addSubview:[[emptyViewController alloc]init].view];
    
    



}

#pragma mark # timer2
//闪屏
-(void)forTimer{
    forTimerBool = !forTimerBool;
    if (forTimerBool) {
        self.view.backgroundColor = [UIColor whiteColor];
    }else
        self.view.backgroundColor = [UIColor blackColor];
}
-(void)sliderChanged{
    NSLog(@"slider!!!");
//    if (timeInterval != slider.value) {
        timeInterval = slider.value;
        [nsTimer invalidate];
        nsTimer = nil;
        nsTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval
                                                   target:self selector:@selector(forTimer)
                                                 userInfo:[NSData data]
                                                  repeats:YES];
        label.text = [NSString stringWithFormat:@"%f",slider.value];
//    }else{
//            }


}

@end
