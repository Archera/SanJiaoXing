//
//  DrawArrow.m
//  SanJiaoXing
//
//  Created by Liu on 13-7-12.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import "DrawArrow.h"

@implementation DrawArrow

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
        [self setBackgroundColor:[UIColor clearColor]];
        start = startPoint;
        end = endPoint;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawArrow:start andEndPoint:end];
}

//画箭头
- (void)drawArrow:(CGPoint)startPoint_ andEndPoint:(CGPoint)endPoint_
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    if (startPoint_.x<endPoint_.x)
    {
        //0度,1,4
        CGContextMoveToPoint (ctx, 0, 0);
        CGContextAddCurveToPoint(ctx, 0, 0, CZX/3, DB/2, 0, DB);
        CGContextAddLineToPoint(ctx, 0, DB);
        CGContextAddLineToPoint(ctx, CZX, DB/2);
    }
    else if(startPoint_.x>endPoint_.x)
    {
        //180,2,3
        CGContextMoveToPoint (ctx, CZX, 0);
        CGContextAddCurveToPoint(ctx, CZX, 0, CZX*2/3, DB/2, CZX, DB);
        CGContextAddLineToPoint(ctx, CZX, DB);
        CGContextAddLineToPoint(ctx, 0, DB/2);
    }
    else if (startPoint_.x==endPoint_.x)
    {
        if (startPoint_.y>endPoint_.y)
        {
            //箭头↑
            CGContextMoveToPoint (ctx, 0, CZX);
            CGContextAddCurveToPoint(ctx, 0, CZX, DB/2, CZX*2/3, DB, CZX);
            CGContextAddLineToPoint(ctx, DB, CZX);
            CGContextAddLineToPoint(ctx, DB/2, 0);
        }
        else
        {
            //箭头↓
            CGContextMoveToPoint (ctx, 0, 0);
            CGContextAddCurveToPoint(ctx, 0, 0, DB/2, CZX/3, DB, 0);
            //CGContextAddQuadCurveToPoint(ctx, DB/2, CZX/3, DB, 0);
            CGContextAddLineToPoint(ctx, DB, 0);
            CGContextAddLineToPoint(ctx, DB/2, CZX);
        }
        
    }
    CGContextClosePath(ctx);//假如想封闭一条路径，那么调用函数 CGContextClosePath 把当前点和起点连接起来,这里是三角形当然是封闭的路径
    CGContextSetRGBFillColor(ctx, 1, 1, 0, 1);
    CGContextFillPath(ctx);
}

@end
