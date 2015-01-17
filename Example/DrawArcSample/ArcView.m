//
//  ArcView.m
//  DrawArcSample
//
//  Created by keygx on 2014/12/06.
//  Copyright (c) 2014年 keygx. All rights reserved.
//

#import "ArcView.h"

@interface ArcView ()

@property (nonatomic) UIColor *circleColor;
@property (nonatomic) UIColor *arcColor;
@property (nonatomic) UIColor *fillColor;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat w;
@property (nonatomic) CGFloat h;
@property (nonatomic) UILabel *percentageLabel;

@end

@implementation ArcView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor lightGrayColor];
        self.circleColor     = [UIColor greenColor];
        self.arcColor        = [UIColor orangeColor];
        self.fillColor       = [UIColor clearColor];
        self.w               = 200.0f;
        self.h               = 200.0f;
        self.lineWidth       = 30.0f;
        
        [self setUpdateValueLabel:frame];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawArc:rect];
}

- (void)drawArc:(CGRect)rect
{
     // 値が0の時の対応
    if (self.updateValue == 0.0f) {
        self.updateValue = -1.0f;
    }
    
    /*** ベースとなる円の描画 ***/
    // 塗りつぶしの指定
    [self.fillColor setFill];
    
    // 線色の指定
    [self.circleColor setStroke];
    
    // 弧を描画
    CGFloat circleStartAngle = (self.updateValue * 2.0f * M_PI - M_PI_2);
    CGFloat circleEndAngle = - (M_PI_2);
    
    // 円弧（UIBezierPath）を生成
    UIBezierPath *circle = [UIBezierPath bezierPathWithArcCenter:CGPointMake([self halfValue:rect.size.width],
                                                                             [self halfValue:rect.size.height])
                                                          radius:[self halfValue:self.w]
                                                      startAngle:circleStartAngle
                                                        endAngle:circleEndAngle
                                                       clockwise:YES];
    // 円弧の太さ
    [circle setLineWidth:self.lineWidth];
    
    // 円を描画
    [circle fill];
    [circle stroke];
    
    /*** 値分の弧の描画 ***/
    // 線色の指定
    [self.arcColor setStroke];
    
    CGFloat arcStartAngle = - (M_PI_2);
    CGFloat arcEndAngle = (self.updateValue * 2.0f * M_PI - M_PI_2);
    
    // 円弧（UIBezierPath）を生成
    UIBezierPath *arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake([self halfValue:rect.size.width],
                                                                          [self halfValue:rect.size.height])
                                                       radius:[self halfValue:self.w]
                                                   startAngle:arcStartAngle
                                                     endAngle:arcEndAngle
                                                    clockwise:YES];
    
    // 円弧の太さ
    [arc setLineWidth:self.lineWidth];
    
    // 円を描画
    [arc fill];
    [arc stroke];
}

- (void)setUpdateValueLabel:(CGRect)frame
{
    self.percentageLabel = [[UILabel alloc] initWithFrame:CGRectMake([self halfValue:frame.size.width] - 30 - 2,
                                                                     [self halfValue:frame.size.height] - 10 + 1,
                                                                     60,
                                                                     20)];
    self.percentageLabel.text = @"0.0％";
    self.percentageLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    self.percentageLabel.textColor = [UIColor whiteColor];
    self.percentageLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.percentageLabel];
}

- (void)updateLabelValue:(CGFloat)value
{
    self.percentageLabel.text = [NSString stringWithFormat:@"%.1f％", value * 100];
}

- (CGFloat)halfValue:(CGFloat)value
{
    return value / 2.0f;
}

//- (void)drawRect:(CGRect)rect
//{
//    // 線色の指定
//    [self.circleColor setStroke];
//    
//    // 塗りつぶしの指定
//    [self.fillColor setFill];
//    
//    // 円弧（UIBezierPath）を生成
//    UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake([self halfValue:rect.size.width] - [self halfValue:self.w],
//                                                                             [self halfValue:rect.size.height] - [self halfValue:self.h],
//                                                                             self.w,
//                                                                             self.h)];
//    
//    // 円弧の太さ
//    [circle setLineWidth:self.lineWidth];
//    
//    // 円を描画
//    [circle fill];
//    [circle stroke];
//    
//    /////////////////////
//    
//    // 線色の指定
//    [self.arcColor setStroke];
//    
//    CGFloat startAngle = - (M_PI_2);
//    CGFloat endAngle = (self.value * 2.0f * M_PI - M_PI_2);
//    
//    // 円弧（UIBezierPath）を生成
//    UIBezierPath *arc = [UIBezierPath bezierPathWithArcCenter:CGPointMake([self halfValue:rect.size.width],
//                                                                          [self halfValue:rect.size.height])
//                                                       radius:[self halfValue:self.w]
//                                                   startAngle:startAngle
//                                                     endAngle:endAngle
//                                                    clockwise:YES];
//    
//    // 円弧の太さ
//    [arc setLineWidth:self.lineWidth];
//    
//    // 円を描画
//    [arc fill];
//    [arc stroke];
//}

@end
