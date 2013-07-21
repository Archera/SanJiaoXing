//
//  CalculationPoint.h
//  DashLine
//
//  Created by Liu on 13-7-3.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculationPoint : NSObject

CGFloat filterPoint (CGPoint start, CGPoint mid);
CGFloat distanceBetweenPoints (CGPoint first, CGPoint second);
CGFloat angleBetweenPoints(CGPoint first, CGPoint second);
CGFloat angleBetweenLines(CGPoint line1Start, CGPoint line1End, CGPoint line2Start, CGPoint line2End);
CGPoint otherPoint(CGPoint line1Start, CGFloat jiaodu, CGFloat changdu, int mark);
@end
