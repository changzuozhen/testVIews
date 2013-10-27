//
//  testViewViewController2.m
//  testviews
//
//  Created by William on 13-5-26.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewViewController2.h"
@interface testViewViewController2(){
    __weak IBOutlet UISegmentedControl *segment1;
    __weak IBOutlet UISegmentedControl *segment2;
    
}
- (IBAction)chongzhi;
@end

@implementation testViewViewController2
-(void)viewDidLoad{
    UIView * view1;
    UIView * view2;
    UIView * view3;
    UIView * view4;
    view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 30, 80, 80)];
    view2 = [[UIView alloc]initWithFrame:CGRectMake(20, 10, 80, 80)];
    view3 = [[UIView alloc]initWithFrame:CGRectMake(30, 40, 80, 80)];
    view4 = [[UIView alloc]initWithFrame:CGRectMake(40, 20, 80, 80)];
    NSMutableArray * viewSet = [[NSMutableArray alloc]init];
    [viewSet addObject:view1];
    [viewSet addObject:view2];
    [viewSet addObject:view3];
    [viewSet addObject:view4];
    NSLog(@"%d",[viewSet count]);
    float a1 =0.1,b1=0.3,c1=0.5,d1=0;
    for (UIView * aview in viewSet) {
        [aview setAlpha:1];
        [aview setBackgroundColor:[UIColor colorWithRed:a1 green:b1 blue:c1 alpha:1]];
        d1=a1;
        a1=b1;
        b1=c1;
        c1=d1;
        [[self view]addSubview:aview];
    }
    

    [self test1];

}

-(void) test1{
    UIView * v1 = [[UIView alloc] initWithFrame:CGRectMake(30, 180, 100, 100)];
    v1.backgroundColor = [UIColor colorWithRed:1 green:0.4 blue:1 alpha:1];
    UIView * v2 = [[UIView alloc] initWithFrame:CGRectInset(v1.bounds, 10, 10)];
    v2.backgroundColor = [UIColor colorWithRed:0.5 green:1 blue:0 alpha:1];
    [self.view addSubview:v1];
    [v1 addSubview:v2];
    //    v1.clipsToBounds = YES;
    [v2 setFrame:CGRectMake(-10, 0, v2.bounds.size.width, v2.bounds.size.height)];
    //    v2.center = [v1 convertPoint:v1.center fromView:self.view];
    //    v2.center = [self.view convertPoint:v1.center toView:v1];
    v2.center = [v1 convertPoint:v1.center fromView:v1.superview];
    
    v1.transform = CGAffineTransformMakeRotation(45/180.0*M_PI);
}
- (IBAction)chongzhi {
    //    imageView.frame= CGRectMake(0, 0, image.size.width, image.size.height);
    NSLog(@"--------");
    
    //    NSLog(@"frame  %f,%f,%f,%f",imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
    //    NSLog(@"bounds %f,%f,%f,%f",imageView.bounds.origin.x,imageView.bounds.origin.y,imageView.bounds.size.width,imageView.bounds.size.height);
    //    NSLog(@"%f,%f",c.x,c.y);
    //    self.view.layer
    
    [self.view exchangeSubviewAtIndex:[segment1 selectedSegmentIndex] withSubviewAtIndex:[segment2 selectedSegmentIndex]];
    NSLog(@"segment1 selectedSegmentIndex  %d  ;  segment1 selectedSegmentIndex  %d",[segment1 selectedSegmentIndex],[segment2 selectedSegmentIndex]);
}

@end
