//
//  DrawDashLine.m
//  SanJiaoXing
//
//  Created by Liu on 13-7-12.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import "DrawDashLine.h"
#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)
@implementation DrawDashLine

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
        
        //计算出角度
        test = angleBetweenPoints(start,end);
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawDashLine:start andEndPoint:end];
}

- (int)xiangxian
{
    int mark = 0;
    if (start.x<end.x)
    {
        //0度,1,4
        if (start.y>end.y) {
            mark = 1;
        }
        else
        {
            mark = 4;
        }
    }
    else if(start.x>end.x)
    {
        //180,2,3
        if (start.y>end.y)
        {
            mark = 2;
        }
        else
        {
            mark = 3;
        }
    }
    return mark;
}

//截取线段
- (void)intercept
{
    if (start.y == end.y)
    {
        if (start.x<end.x)
        {
            //箭头→
            lastEnd.x = end.x-CZX/2;
        }
        else
        {
            //箭头←
            lastEnd.x = end.x+CZX/2;
        }
        lastEnd.y = end.y;
    }
    else if (start.x == end.x)
    {
        if (start.y>end.y)
        {
            //箭头↑
            lastEnd.y = end.y+CZX/2;
        }
        else
        {
            //箭头↓
            lastEnd.y = end.y-CZX/2;
        }
        lastEnd.x = end.x;
    }
    else
    {
        int mark = [self xiangxian];
        lastEnd = otherPoint(end,test,8.0,mark);
    }
}

- (void)drawDashLine:(CGPoint)startPoint_ andEndPoint:(CGPoint)endPoint_
{
    //计算虚线长度，如果虚线长度＜=CZX，则不画箭头
    float line = distanceBetweenPoints(startPoint_,endPoint_);
    if (line>CZX)
    {
        [self intercept];
        [self drawArrow];
    }
    else
    {
        lastEnd=end;
    }
    
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
    CGContextAddLineToPoint(context, lastEnd.x,lastEnd.y);
    CGContextStrokePath(context);
    CGContextClosePath(context);
    
}

//画箭头
- (void)drawArrow
{
    DrawArrow *arrow =nil;
    if (start.x<end.x)
    {
        //0度,1,4
        arrow = [[DrawArrow alloc] initWithFrame:CGRectMake(end.x-CZX, end.y-DB/2, CZX, DB) andStartPoint:start andEndPoint:end];
        CGAffineTransform transform1 = CGAffineTransformMakeTranslation(-CZX/2, 0);
        CGAffineTransform transform2 = CGAffineTransformMakeRotation(degreesToRadian(-test));
        CGAffineTransform transform3 = CGAffineTransformMakeTranslation(CZX/2, 0);
        CGAffineTransform transform4 = CGAffineTransformConcat(transform1, transform2);
        CGAffineTransform transform = CGAffineTransformConcat(transform4, transform3);
        arrow.transform = transform;
    }
    else if(start.x>end.x)
    {
        //180,2,3
        arrow = [[DrawArrow alloc] initWithFrame:CGRectMake(end.x, end.y-DB/2, CZX, DB) andStartPoint:start andEndPoint:end];
        CGAffineTransform transform1 = CGAffineTransformMakeTranslation(CZX/2, 0);
        CGAffineTransform transform2 = CGAffineTransformMakeRotation(degreesToRadian(-test));
        CGAffineTransform transform3 = CGAffineTransformMakeTranslation(-CZX/2, 0);
        CGAffineTransform transform4 = CGAffineTransformConcat(transform1, transform2);
        CGAffineTransform transform = CGAffineTransformConcat(transform4, transform3);
        arrow.transform = transform;
    }
    else if(start.x==end.x)
    {
        if (start.y>end.y) {
            arrow = [[DrawArrow alloc] initWithFrame:CGRectMake(end.x-DB/2, end.y, DB, CZX) andStartPoint:start andEndPoint:end];
        }
        else
        {
            arrow = [[DrawArrow alloc] initWithFrame:CGRectMake(end.x-DB/2, end.y-CZX, DB, CZX) andStartPoint:start andEndPoint:end];
        }
        
    }
    [self addSubview:arrow];
    [arrow release];
}

@end
