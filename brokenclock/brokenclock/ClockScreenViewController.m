//
//  ClockScreenViewController.m
//  brokenclock
//
//  Created by dasMajo on 13/03/16.
//  Copyright © 2016 dasMajo. All rights reserved.
//

#import "ClockScreenViewController.h"

@interface ClockScreenViewController ()

@property (nonatomic, strong) UIView *clockBackground;
@property (nonatomic, strong) UILabel *clockLabel;

@property (nonatomic, strong) NSDateFormatter *clockFormatter;
@property (nonatomic, strong) NSTimer *clockTimer;

@end

@implementation ClockScreenViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.clockFormatter = [NSDateFormatter new];
        self.clockFormatter.dateFormat = @"HH:mm:ss";
    }
    return self;
}


-(void) loadView {
    [super loadView];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.clockBackground = [UIView new];
    self.clockBackground.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.clockBackground];
    
    self.clockLabel = [UILabel new];
    self.clockLabel.textAlignment = NSTextAlignmentCenter;
    self.clockLabel.textColor = [UIColor whiteColor];
    self.clockLabel.font = [UIFont boldSystemFontOfSize:30.0];
    [self.view addSubview:self.clockLabel];
}

-(void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.clockBackground.frame = CGRectMake(40,
                                            40,
                                            CGRectGetWidth(self.view.frame) - 100,
                                            50);
    self.clockLabel.frame = CGRectMake(0,
                                       CGRectGetMinY(self.clockBackground.frame) - 5,
                                       CGRectGetWidth(self.clockBackground.frame),
                                       40);
}

-(void) viewWillAppear:(BOOL)inAnimated {
    [super viewWillAppear:inAnimated];

}

-(void) viewDidAppear:(BOOL)inAnimated {
    [super viewDidAppear:inAnimated];

    self.clockTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                       target:self
                                                     selector:@selector(onClockTimer:)
                                                     userInfo:nil
                                                      repeats:TRUE];
}

-(void) viewWillDisappear:(BOOL)inAnimated {
    [super viewWillDisappear:inAnimated];
    
    [self.clockTimer invalidate];
    self.clockTimer = nil;
}

-(void) viewDidDisappear:(BOOL)inAnimated {
    [super viewDidDisappear:inAnimated];
    
}

#pragma mark - TimerCallback

-(void) onClockTimer:(NSTimer *)inTimer {
    NSDate *now = [NSDate date];
    self.clockLabel.text = [self.clockFormatter stringFromDate:now];
}

@end
