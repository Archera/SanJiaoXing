//
//  DrawArrow.h
//  SanJiaoXing
//
//  Created by Liu on 13-7-12.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawArrow : UIView
{
    CGPoint start;
    CGPoint end;
}
- (id)initWithFrame:(CGRect)frame andStartPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint;
@end
