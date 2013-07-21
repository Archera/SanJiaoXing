//
//  ViewController.m
//  SanJiaoXing
//
//  Created by Liu on 13-7-11.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize sjx,pointArray;
- (void)dealloc
{
    [pointArray release];
    [sjx release];
    [_backView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self addDashView];
    
    
}
- (IBAction)test:(id)sender
{
//    CGPoint start = CGPointMake(50, 50);
//    CGPoint end = CGPointMake(10, 50);
//    CGFloat test = angleBetweenPoints(start,end);
//    NSLog(@"%f",test);
//    int send = (int)time(NULL);
//    srand(send);
//    float a = rand()%300;
//    srand(send+1);
//    float b = rand()%450;
//    srand(send+2);
//    float c = rand()%300;
//    srand(send+3);
//    float d = rand()%450;
    
//    CGPoint kais = CGPointMake(170, 170);
//    CGPoint jies = CGPointMake(20, 20);
//    
//    
//    DrawDashLine *shang = [[DrawDashLine alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50) andStartPoint:kais andEndPoint:jies];
//    
//    [self.backView addSubview:shang];
//    sjx = shang;
//    [sjx release];
    [self.pointArray removeAllObjects];
    self.pointArray = nil;
    [self clearDashView];
}

- (void)clearDashView
{
    for (DrawDashLine *s in self.backView.subviews)
    {
        [s removeFromSuperview];
    }
}

- (void)addDashView
{
    if (self.pointArray.count>1)
    {
        for (int i = 0; i<self.pointArray.count-1; i++)
        {
            startPin = [[self.pointArray objectAtIndex:i] CGPointValue];
            startPin.y = startPin.y-51;
            endPin = [[self.pointArray objectAtIndex:i+1] CGPointValue];
            endPin.y =endPin.y-51;
            DrawDashLine *shang = [[DrawDashLine alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50) andStartPoint:startPin andEndPoint:endPin];
            
            [self.backView addSubview:shang];
            sjx = shang;
            [sjx release];
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (self.pointArray==nil)
    {
        NSMutableArray *dataArray = [[NSMutableArray alloc] init];
        self.pointArray = dataArray;
        [dataArray release];
    }
    for (UITouch *t in touches)
    {
        startPin = [t locationInView:sjx];
        [self.pointArray addObject:[NSValue valueWithCGPoint:startPin]];
    }
    if (self.pointArray.count>1)
    {
        [self clearDashView];
        [self addDashView];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
