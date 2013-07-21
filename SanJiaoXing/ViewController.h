//
//  ViewController.h
//  SanJiaoXing
//
//  Created by Liu on 13-7-11.
//  Copyright (c) 2013年 Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DrawSJX.h"
#import "DrawDashLine.h"
@interface ViewController : UIViewController
{
    CGPoint startPin;
    CGPoint endPin;
}
@property (retain, nonatomic) IBOutlet UIView *backView;
@property (nonatomic,retain) DrawDashLine *sjx;
@property (nonatomic,retain) NSMutableArray *pointArray;
@end
