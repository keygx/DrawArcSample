//
//  ViewController.m
//  DrawArcSample
//
//  Created by keygx on 2014/12/06.
//  Copyright (c) 2014年 keygx. All rights reserved.
//

#import "ViewController.h"
#import "ArcView.h"

@interface ViewController ()

@property (nonatomic) ArcView *arc;
@property (nonatomic, weak) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.arc = [[ArcView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.arc];
    
    [self.view bringSubviewToFront:self.slider];
}

- (IBAction)sliderAction:(id)sender
{
    NSLog(@"%@", @(self.slider.value));
    
    // パーセント表示の更新
    [self.arc updateLabelValue:self.slider.value];
    
    // 円弧の描画の更新
    self.arc.updateValue = self.slider.value;
    [self.arc setNeedsDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
