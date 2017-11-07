//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *framingView;
@property (nonatomic, strong) UIView *redBoxView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

@property (nonatomic) CGRect blueInitialRect;


@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;

    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    framingViewCenterXConstraint.active = YES;
    
    NSLayoutConstraint *framingViewCenterY = [NSLayoutConstraint constraintWithItem:framingView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-50.0];
    framingViewCenterY.active = YES;
    
    self.framingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:500.0];
    self.framingViewHeightConstraint.active = YES;
    
    self.framingViewWidthConstraint = [NSLayoutConstraint constraintWithItem:framingView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:500.0];
    self.framingViewWidthConstraint.active = YES;

    
    // Set up your views and constraints here
    
    //Purple Box
    
    UIView *purpleBoxView = [[UIView alloc]initWithFrame:CGRectZero];
    purpleBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleBoxView.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleBoxView];
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:purpleBoxView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeWidth multiplier:(305.0/500.0) constant:0].active = YES;
    
    //Red Box
    
    self.redBoxView = [[UIView alloc]initWithFrame:CGRectZero];
    self.redBoxView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redBoxView.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:self.redBoxView];
    
    [NSLayoutConstraint constraintWithItem:self.redBoxView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-20].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.redBoxView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20].active = YES;

    [NSLayoutConstraint constraintWithItem:self.redBoxView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.redBoxView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:150].active = YES;
    
    //Orange Box Right
    
    UIView *orangeBoxRightView = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBoxRightView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxRightView.backgroundColor = [UIColor orangeColor];
    [self.redBoxView addSubview:orangeBoxRightView];
    
    [NSLayoutConstraint constraintWithItem:orangeBoxRightView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.redBoxView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxRightView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redBoxView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxRightView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxRightView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
    
    //Orange Box Left
    
    UIView *orangeBoxLeftView = [[UIView alloc]initWithFrame:CGRectZero];
    orangeBoxLeftView.translatesAutoresizingMaskIntoConstraints = NO;
    orangeBoxLeftView.backgroundColor = [UIColor orangeColor];
    [self.redBoxView addSubview:orangeBoxLeftView];
    
    [NSLayoutConstraint constraintWithItem:orangeBoxLeftView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.redBoxView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxLeftView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.redBoxView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxLeftView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:orangeBoxLeftView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:70].active = YES;
    
    //Blue Boxes
    
    //Top Blue Box
    
    UIView *blueBoxTopView = [[UIView alloc]initWithFrame:CGRectZero];
    blueBoxTopView.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxTopView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxTopView];
    
    [NSLayoutConstraint constraintWithItem:blueBoxTopView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxTopView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxTopView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxTopView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:0.25 constant:0].active = YES;
    
    
    
    //Middle Blue Box
    
    UIView *blueBoxMiddleView = [[UIView alloc]initWithFrame:CGRectZero];
    blueBoxMiddleView.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxMiddleView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxMiddleView];
    
    [NSLayoutConstraint constraintWithItem:blueBoxMiddleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxMiddleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxMiddleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxMiddleView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0].active = YES;
    
    //Bottom Blue Box
    
    UIView *blueBoxBottomView = [[UIView alloc]initWithFrame:CGRectZero];
    blueBoxBottomView.translatesAutoresizingMaskIntoConstraints = NO;
    blueBoxBottomView.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueBoxBottomView];
    
    [NSLayoutConstraint constraintWithItem:blueBoxBottomView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeHeight multiplier:1.0 constant:50].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxBottomView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:50].active = YES;

    [NSLayoutConstraint constraintWithItem:blueBoxBottomView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:blueBoxBottomView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.framingView attribute:NSLayoutAttributeCenterY multiplier:1.75 constant:0].active = YES;
    
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
