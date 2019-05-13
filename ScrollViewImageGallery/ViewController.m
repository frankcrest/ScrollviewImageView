//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Frank Chen on 2019-05-13.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* firstImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infield"]];
    firstImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView* secondImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lighthouse"]];
    secondImageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView* thirdImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"night"]];
    thirdImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIStackView* stackView =[[UIStackView alloc]init];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    
    [stackView addArrangedSubview:firstImageView];
    [stackView addArrangedSubview:secondImageView];
    [stackView addArrangedSubview:thirdImageView];
    
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stackView];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [firstImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                               [secondImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                               [thirdImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                              [firstImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              [secondImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              [thirdImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                                              [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
                                              ]];
    
    
}


@end
