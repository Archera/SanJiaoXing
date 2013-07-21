//
//  DrawSJX.m
//  SanJiaoXing
//
//  Created by Liu on 13-7-11.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import "DrawSJX.h"

@implementation DrawSJX

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andStartPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor whiteColor]];
        start = startPoint;
        end = endPoint;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //画虚线
    [self drawDashLine:start andEndPoint:end];
    
    //画箭头
    [self drawArrow:start andEndPoint:end];
}

- (void)drawDashLine:(CGPoint)startPoint_ andEndPoint:(CGPoint)endPoint_
{
    //画虚线
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextSetLineWidth(context, LineWidth);
    CGContextSetRGBStrokeColor(context, 1, 1, 0, 1);//线条颜色
    CGContextSetStrokeColorWithColor(context, [UIColor yellowColor].CGColor);
    //lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    float lengths[] = {30,15};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, startPoint_.x, startPoint_.y);
    CGContextAddLineToPoint(context, endPoint_.x,endPoint_.y);
    CGContextStrokePath(context);
    CGContextClosePath(context);
}

//画箭头
- (void)drawArrow:(CGPoint)startPoint_ andEndPoint:(CGPoint)endPoint_
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    if (startPoint_.x<endPoint_.x)
    {
        //0度,1,4
        CGContextMoveToPoint (ctx, endPoint_.x-CZX, endPoint_.y-DB/2);
        CGContextAddLineToPoint(ctx, endPoint_.x-CZX, endPoint_.y+DB/2);
    }
    else if(startPoint_.x>endPoint_.x)
    {
        //180,2,3
        CGContextMoveToPoint (ctx, endPoint_.x+CZX, endPoint_.y-DB/2);
        CGContextAddLineToPoint(ctx, endPoint_.x+CZX, endPoint_.y+DB/2);
    }
    CGContextAddLineToPoint(ctx, endPoint_.x, endPoint_.y);
    CGContextClosePath(ctx);
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillPath(ctx);
}


@end
