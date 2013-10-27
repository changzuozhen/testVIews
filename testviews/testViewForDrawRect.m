//
//  testViewForDrawRect.m
//  testviews
//
//  Created by William on 13-5-27.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewForDrawRect.h"

@implementation testViewForDrawRect
- (void)drawRect:(CGRect)rect{
    CGRect bounds = [self bounds];
    [[UIColor greenColor]set];
    UIRectFill(bounds);
    
    CGRect squre = CGRectMake(50, 50, 100, 100);
    [[UIColor yellowColor]set];
    UIRectFill(squre);
    [[UIColor blackColor]set];
    UIRectFrame(squre);
}
@end
