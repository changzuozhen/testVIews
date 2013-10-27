//
//  testViewcontroller3.m
//  testviews
//
//  Created by William on 13-5-27.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewcontroller3.h"
#import "testViewForDrawRect.h"
@implementation testViewcontroller3
-(void)viewDidLoad{
//    UIImage * stone = [[UIImage  alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"black_stone_shaded" ofType:@"png"]];
//    UIImage * stone = [UIImage imageNamed:@"black_stone_shaded.png"];
//    [self.view addSubview:[[UIImageView alloc]initWithImage:stone]];
    [self test1];
    [self test2];
    [self test3];//画线，画三角形
}
-(void)test1{
    UIImage * stone = [UIImage imageNamed:@"black_stone_shaded.png"];
//    CGSize sz = [stone size];
    CGImageRef stoneLeft = CGImageCreateWithImageInRect([stone CGImage], CGRectMake(0, 0, stone.size.width/2.0, stone.size.height));
    CGImageRef stoneRight = CGImageCreateWithImageInRect([stone CGImage], CGRectMake(stone.size.width/2.0, 0, stone.size.width, stone.size.height));
    //draw each CGImage into an image context
    UIGraphicsBeginImageContext(CGSizeMake(stone.size.width*1.5, stone.size.height));
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextDrawImage(con, CGRectMake(0, 0, stone.size.width/2.0, stone.size.height), stoneLeft);
    CGContextDrawImage(con, CGRectMake(stone.size.width, 0, stone.size.width/2.0, stone.size.height), stoneRight);
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(stoneLeft);
    CGImageRelease(stoneRight);
    [self.view addSubview:[[UIImageView alloc]initWithImage:im]];
}
-(void)test2{
    testViewForDrawRect * mv = [[testViewForDrawRect alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width-50, 150)];
    mv.center = self.view.center;
    [self.view addSubview:mv];
    mv.opaque = NO;
}
-(void)test3{
    //画线
    CGRect rect = CGRectMake(50, 50, self.view.bounds.size.width-100, 100);
    [[UIColor redColor]set];
    UIView * testView = [[UIView alloc]initWithFrame:rect];
    [testView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:testView];
 
    
    UIGraphicsBeginImageContext(CGSizeMake(200 ,100));
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    //画红线
    [[UIColor redColor]set];
    CGContextSetLineWidth(con, 5);
    CGContextMoveToPoint(con, 10, 10);
    CGContextAddLineToPoint(con, 50, 50);
    CGContextStrokePath(con);
    
    //画绿色三角形
    CGContextSetFillColorWithColor(con, [[UIColor greenColor]CGColor]);
    CGContextMoveToPoint(con, 20, 10);
    CGContextAddLineToPoint(con, 60, 50);
    CGContextAddLineToPoint(con, 70, 30);
    CGContextFillPath(con);
    //擦掉一部分三角形
    CGContextSetFillColorWithColor(con, [[UIColor greenColor]CGColor]);
    CGContextMoveToPoint(con, 20, 10);
    CGContextAddLineToPoint(con, 60, 50);
    CGContextAddLineToPoint(con, 50, 30);
    CGContextSetBlendMode(con, kCGBlendModeClear);
    CGContextFillPath(con);
    
    UIImage * im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [testView addSubview:[[UIImageView alloc]initWithImage:im]];
}

@end
