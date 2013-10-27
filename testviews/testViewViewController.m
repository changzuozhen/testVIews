//
//  testViewViewController.m
//  testviews
//
//  Created by William on 13-5-20.
//  Copyright (c) 2013年 William. All rights reserved.
//

#import "testViewViewController.h"
CGPoint midpointBetweenPoints(CGPoint a, CGPoint b);
@interface testViewViewController (){
    UIImage * image;
    UIImageView * imageView;
    int count;
    CGPoint c;
    CGPoint d;
    CGPoint tapLocation;
    BOOL multipleTouches;
    BOOL twoFingerTapIsPossible;
    
    

    
//    __weak IBOutlet UISlider *alphaSlider;

    __weak IBOutlet UILabel *alphaValue;
    __weak IBOutlet UIView *alphaViewTest;
//    __weak IBOutlet UISlider *alphaOfSlider;
}
- (IBAction)resetImageBounds:(UIButton *)sender;

@end

@implementation testViewViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"super viewDidLoad");
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view setAlpha:1];
        
    
    NSLog(@"finished view did load");
    
    
    
    [self.view setMultipleTouchEnabled:YES];
    
    [self.subview setMultipleTouchEnabled:YES];
    [self->imageView setMultipleTouchEnabled:YES];
    
    [self.subview setBackgroundColor:[UIColor greenColor]];
    [self.subview setAlpha:0.7];

    NSString * imagePath = [[NSBundle mainBundle] pathForResource:@"WorkToWin_thumb" ofType:@"png"];
    NSData * imageData = [[NSData alloc]initWithContentsOfFile:imagePath];
    image = [UIImage imageWithData:imageData];
    if (image) {
        NSLog(@"haha");
        imageView = [[UIImageView alloc]init];
        [imageView setImage:image];
        imageView.image = image;
        imageView.backgroundColor = [UIColor blueColor];
        imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);

        [self.subview addSubview:imageView];
    }

	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ###touches locations
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        CGPoint a = [touch locationInView:self.view];
//        NSLog(@"%f,%f",a.x,a.y);
        CGPoint b = [touch locationInView:self.subview];
//        NSLog(@"%f,%f",b.x,b.y);
        c = [self.view convertPoint:b fromView:self.subview];
        d = [self.subview convertPoint:[touch locationInView:imageView] fromView:imageView];
        self.label.text = [NSString stringWithFormat:@"%5.1f,%5.1f\n%5.1f,%5.1f",a.x,a.y,b.x,b.y];
//        [self.view setNeedsDisplay];
        count++;
        self->imageView.bounds = CGRectMake(count, count, image.size.width-count, image.size.height);
        NSLog(@"--------");
        NSLog(@"frame  %f,%f,%f,%f",imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
        NSLog(@"bounds %f,%f,%f,%f",imageView.bounds.origin.x,imageView.bounds.origin.y,imageView.bounds.size.width,imageView.bounds.size.height);
        NSLog(@"imageView->subview  %f,%f",d.x,d.y);
        
    }
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch * touch in touches) {
        CGPoint ta = [touch locationInView:self.view];
        CGPoint tb = [touch locationInView:self.subview];
        //c==a
        CGPoint tc = [self.view convertPoint:tb fromView:self.subview];
        self.label.text = [NSString stringWithFormat:@"%5.1f,%5.1f\n%5.1f,%5.1f\n%5.1f,%5.1f",ta.x,ta.y,tb.x,tb.y,tc.x,tc.y];
        [self.view bringSubviewToFront:self.label];
        self->imageView.bounds = self->imageView.frame;
        NSLog(@"%f,%f,%f,%f",imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
    }
}

#pragma mark ###touches counts
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touches count  %d",[touches count]);
//    NSLog(@"touches in view count  %d",[[event touchesForView:self.view]count]);
//    NSLog(@"touches in subview count  %d",[[event touchesForView:self.subview]count]);
//    NSLog(@"touches in imageView count %d",[[event touchesForView:self->imageView]count]);
//}
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"TapDetectingView touchesBegan");
//    // cancel any pending handleSingleTap messages
//    NSLog(@"handleSingleTap");
////    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(handleSingleTap) object:nil];
//    
//    // update our touch state
//
//    if ([[event touchesForView:self.view] count] > 1){
//        multipleTouches = YES;twoFingerTapIsPossible=YES;}
//    if ([[event touchesForView:self.view] count] > 2)
//        twoFingerTapIsPossible = NO;
//    
//}
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"TapDetectingView touchesCancelled");
//    NSLog(@"twoFingerTapIsPossible = YES;multipleTouches = NO;");
//    twoFingerTapIsPossible = YES;
//    multipleTouches = NO;
//}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"TapDetectingView touchesEnded");
//    BOOL allTouchesEnded = ([touches count] == [[event touchesForView:self.view] count]);
//    NSLog(@"touches count : %d \t view touches count : %d",[touches count],[[event touchesForView:self.view]count]);
//    NSLog(@"allTouchesEnded ++++  %d",allTouchesEnded);
//    // first check for plain single/double tap, which is only possible if we haven't seen multiple touches
//    if (!multipleTouches) {
//        UITouch *touch = [touches anyObject];
//        tapLocation = [touch locationInView:self.view];
//        
//        if ([touch tapCount] == 1) {
//            NSLog(@"handleSingleTap  ----    afterDelay:DOUBLE_TAP_DELAY");
//            
//        } else if([touch tapCount] == 2) {
//            NSLog(@"handleDoubleTap  ----    -----");
//            
//        }
//    }
//    
//    // check for 2-finger tap if we've seen multiple touches and haven't yet ruled out that possibility
//    else if (multipleTouches && twoFingerTapIsPossible) {
//        
//        // case 1: this is the end of both touches at once
//        if ([touches count] == 2 && allTouchesEnded) {
//            NSLog(@"=========");
//            int i = 0;
//            int tapCounts[2]; CGPoint tapLocations[2];
//            for (UITouch *touch in touches) {
//                tapCounts[i]    = [touch tapCount];
//                tapLocations[i] = [touch locationInView:self.view];
//                i++;
//            }
//            if (tapCounts[0] == 1 && tapCounts[1] == 1) { // it's a two-finger tap if they're both single taps
//                tapLocation = midpointBetweenPoints(tapLocations[0], tapLocations[1]);
//                NSLog(@"handleTwoFingerTap ====");
//            }
//        }
//        
//        // case 2: this is the end of one touch, and the other hasn't ended yet
//        else if ([touches count] == 1 && !allTouchesEnded) {
//            NSLog(@"=== ----");
//            UITouch *touch = [touches anyObject];
//            if ([touch tapCount] == 1) {
//                // if touch is a single tap, store its location so we can average it with the second touch location
//                tapLocation = [touch locationInView:self.view];
//            } else {
//                twoFingerTapIsPossible = NO;
//                NSLog(@"twoFingerTapIsPossible = NO;");
//            }
//        }
//        
//        // case 3: this is the end of the second of the two touches
//        else if ([touches count] == 1 && allTouchesEnded) {
//            UITouch *touch = [touches anyObject];
//            if ([touch tapCount] == 1) {
//                // if the last touch up is a single tap, this was a 2-finger tap
//                tapLocation = midpointBetweenPoints(tapLocation, [touch locationInView:self.view]);
//                NSLog(@"[self handleTwoFingerTap ==== ];");
//            }
//        }
//    }
//    
//    // if all touches are up, reset touch monitoring state
//    if (allTouchesEnded) {
//        NSLog(@"twoFingerTapIsPossible = YES;multipleTouches = NO;allTouchesEnded");
//        twoFingerTapIsPossible = YES;
//        multipleTouches = NO;
//    }
//}
#pragma mark ###button
//- (IBAction)alphaSlider:(UISlider *)sender forEvent:(UIEvent *)event {
//    NSLog(@"%f", alphaOfSlider.value);
//    alphaViewBelow.text=[NSString stringWithFormat:@"%f",sender.value];
//    [alphaViewTest setAlpha:sender.value];
//}
- (IBAction)alphaSlider:(UISlider *)sender {
    alphaValue.text = [NSString stringWithFormat:@"%f",sender.value];
//    NSLog(@"%f",alphaSlider.value);
    [alphaViewTest setAlpha:sender.value];
    
}

- (IBAction)resetImageBounds:(UIButton *)sender {
    imageView.frame= CGRectMake(0, 0, image.size.width, image.size.height);
    NSLog(@"--------");
    
    NSLog(@"frame  %f,%f,%f,%f",imageView.frame.origin.x,imageView.frame.origin.y,imageView.frame.size.width,imageView.frame.size.height);
    NSLog(@"bounds %f,%f,%f,%f",imageView.bounds.origin.x,imageView.bounds.origin.y,imageView.bounds.size.width,imageView.bounds.size.height);
    NSLog(@"%f,%f",c.x,c.y);
//    self.view.layer

}
@end
CGPoint midpointBetweenPoints(CGPoint a, CGPoint b) {
    CGFloat x = (a.x + b.x) / 2.0;
    CGFloat y = (a.y + b.y) / 2.0;
    return CGPointMake(x, y);
}