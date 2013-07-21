//
//  DrawDashLine.h
//  SanJiaoXing
//
//  Created by Liu on 13-7-12.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawArrow.h"
@interface DrawDashLine : UIView
{
    CGPoint start;
    CGPoint end;
    CGPoint lastEnd;
    CGFloat test;
}
- (id)initWithFrame:(CGRect)frame andStartPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint;
@end
