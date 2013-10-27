//
//  aEmptyViewController.m
//  a1234
//
//  Created by William on 13-5-30.
//  Copyright (c) 2013年 William. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "testViewViewController4.h"
#import "class1+category.h"
@interface testViewViewController4 (){
    NSTimer * nsTimer;
     NSTimer * nsTimer2;
    float timeInterval;
    UIProgressView * progressView ;
float progress;
BOOL forTimerBool;
    UIView * box;
#pragma mark $ UIAlertView
    UIAlertView * alert;
}
@end

@implementation testViewViewController4
- (void)viewDidLoad{
    [super viewDidLoad];
    
    #pragma mark $ UIControl//UIProgressView1
    progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.center = self.view.center;
    progressView.progress = 0;
    forTimerBool = YES;
    [self.view addSubview:progressView];
    
    timeInterval = 0.1;
    nsTimer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:self selector:@selector(forTimer) userInfo:[NSData data] repeats:YES];
    
    NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:nsTimer forMode:NSDefaultRunLoopMode];
    
    nsTimer2 = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(forTimer2) userInfo:[NSData data] repeats:YES];
    [runLoop addTimer:nsTimer2 forMode:NSDefaultRunLoopMode];


    // Do any additional setup after loading the view from its nib.
#pragma mark $ UIControl

}
#pragma mark $ UIControl//UIProgressView2
-(void)forTimer{
    if (progress>=1) {
        forTimerBool = NO;
    }else if(progress <= 0){
        forTimerBool = YES;
    }
    switch (forTimerBool) {
        case YES:
            progress += 0.05;
            [progressView setProgress:progress];
            break;
        case NO:
            progress -= 0.05;
            [progressView setProgress:progress];
            break;
        default:
            break;
    }
}
-(void)forTimer2{
    if (box) {
        [box removeFromSuperview];
        box = nil;
    }
}
- (IBAction)animations {
    box = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    box.backgroundColor = [UIColor blueColor];
    [self.view addSubview:box];
    
    [UIView beginAnimations:@"box-animate" context:nil];
    [UIView setAnimationDuration:2];
    
    box.backgroundColor = [UIColor redColor];
    box.frame = CGRectMake(50, 50, 100, 100);
    box.alpha = 0.5;
    
    [UIView commitAnimations];
}
- (IBAction)CABasicAnimation {
        //#import <QuartzCore/QuartzCore.h>
        //    [self.view setAlpha:0.3];
        CABasicAnimation * animation = [CABasicAnimation animation];
        animation.toValue = (id)[UIColor blueColor].CGColor;
        animation.duration = 1;
        animation.autoreverses = YES;
        [self.view.layer addAnimation:animation forKey:@"backgroundColor"];
}
- (IBAction)CAKeyframeAnimation{
    CAKeyframeAnimation * animation=[CAKeyframeAnimation animation];
    animation.values = [NSArray arrayWithObjects:(id)self.view.layer.backgroundColor,(id)[UIColor yellowColor].CGColor,(id)[UIColor greenColor].CGColor,(id)[UIColor blueColor].CGColor,nil];
    animation.duration = 3;
    animation.autoreverses = YES;
    [self.view.layer addAnimation:animation forKey:@"backgroundColor"];
}
- (IBAction)CAKeyframeAnimationPath{
    
    CAKeyframeAnimation * ani = [CAKeyframeAnimation animation];
    
    CGMutablePathRef aPath = CGPathCreateMutable();
    CGPathMoveToPoint(aPath, nil, 20, 20);
    CGPathAddCurveToPoint(aPath, nil, 160, 30, 220, 220, 240, 380);
    
    ani.path = aPath;
    ani.duration = 1;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    ani.rotationMode = @"auto";
    UIImageView * ball = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ball.png"]];
    [self.view addSubview:ball];
    ball.center = CGPointMake(320-20, self.view.bounds.size.height-20);
    [ball setAlpha:0.2];
    NSLog(@"%f",self.view.bounds.size.height);
    [ball.layer addAnimation:ani forKey:@"position"];
    CFRelease(aPath);
    
    //    ball.image = nil;
}
- (IBAction)testCategory:(id)sender{
    class1 * class11 = [[class1 alloc]init];
    [class11 displaySth];
}
- (IBAction)testAlertView {
    NSLog(@"touch");
    NSString * message = [NSString stringWithFormat:@"hello message %@",[UIDevice currentDevice]];
    
    alert = [[UIAlertView alloc]initWithTitle:@"hello" message:message delegate:self cancelButtonTitle:@"button1" otherButtonTitles:@"button2", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"alertView  : %@",alertView);
    NSLog(@"buttonIndex: %d",buttonIndex);
}

@end
