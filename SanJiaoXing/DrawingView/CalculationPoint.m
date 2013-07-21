//
//  CalculationPoint.m
//  DashLine
//
//  Created by Liu on 13-7-3.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import "CalculationPoint.h"
#define pi 3.14159265358979323846
#define degreesToRadian(x) (pi * x / 180.0)
#define radiansToDegrees(x) (180.0 * x / pi)
@implementation CalculationPoint


//过滤坐标
//- (int)filterPoint:(CGPoint)start andMidPoint:(CGPoint)mid
CGFloat filterPoint (CGPoint start, CGPoint mid)
{
	CGFloat pointMark;
    //以终点为参考坐标系
    if (start.x<=mid.x)
    {
        //1,3象限
        if (start.y<mid.y)
        {
            //1
            pointMark = 1;
        }
        else
        {
            //3
            pointMark = 3;
        }
    }
    else {
        //2,4象限
        if (start.y<mid.y)
        {
            //2
            pointMark = 2;
        }
        else
        {
            //4
            pointMark = 4;
        }
    }
    return pointMark;
}

//根据点与点计算出之间的长度
CGFloat distanceBetweenPoints (CGPoint first, CGPoint second) {
    CGFloat deltaX = second.x - first.x;
    CGFloat deltaY = second.y - first.y;
    return sqrt(deltaX*deltaX + deltaY*deltaY );
};
//根据点与点计算出夹角
CGFloat angleBetweenPoints(CGPoint first, CGPoint second) {
    CGFloat height = second.y - first.y;
    CGFloat width = first.x - second.x;
    CGFloat rads = atan(height/width);
    return radiansToDegrees(rads);
    //degs = degrees(atan((top - bottom)/(right - left)))
}
//根据线与线计算出夹角
CGFloat angleBetweenLines(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint line2End) {
    
    CGFloat a = line1End.x - line1Start.x;
    CGFloat b = line1End.y - line1Start.y;
    CGFloat c = line2End.x - line2Start.x;
    CGFloat d = line2End.y - line2Start.y;
    
    CGFloat rads = acos(((a*c) + (b*d)) / ((sqrt(a*a + b*b)) * (sqrt(c*c + d*d))));
    
    return radiansToDegrees(rads);
    
}

//根据点，夹角和长度计算另一个点
CGPoint otherPoint(CGPoint line1Start, CGFloat jiaodu, CGFloat changdu, int mark)
{
    CGFloat x = changdu*cos(pi*jiaodu/180);
    CGFloat y = changdu*sin(pi*jiaodu/180);
    if (x<0) {
        x=-x;
    }
    if (y<0) {
        y=-y;
    }
    CGPoint end;
    switch (mark)
    {
        case 1:
        {
            end = CGPointMake(line1Start.x-x, line1Start.y+y);
        }
            break;
        case 2:
        {
            end = CGPointMake(line1Start.x+x, line1Start.y+y);
        }
            break;
        case 3:
        {
            end = CGPointMake(line1Start.x+x, line1Start.y-y);
        }
            break;
        case 4:
        {
            end = CGPointMake(line1Start.x-x, line1Start.y-y);
        }
            break;
            
        default:
            break;
    }
    
    return end;
}

@end
