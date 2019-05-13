//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Frank Chen on 2019-05-13.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) UIImage* image;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    
}

-(void)setupScrollView{
    UIStackView* stackView = [[UIStackView alloc]init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    
    [self.scrollView addSubview:stackView];
    
    UIImageView* firstImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"lighthouse"]];
    UIImageView* secondImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"infield"]];
    UIImageView* thirdImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"night"]];
    
    firstImageView.contentMode = UIViewContentModeScaleAspectFit;
    secondImageView.contentMode = UIViewContentModeScaleAspectFit;
    thirdImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    firstImageView.userInteractionEnabled = YES;
    secondImageView.userInteractionEnabled = YES;
    thirdImageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer* firstImageTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
     UITapGestureRecognizer* secondImageTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
     UITapGestureRecognizer* thirdImageTapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    
    [firstImageView addGestureRecognizer:firstImageTapGesture];
    [secondImageView addGestureRecognizer:secondImageTapGesture];
    [thirdImageView addGestureRecognizer:thirdImageTapGesture];
    
    firstImageView.translatesAutoresizingMaskIntoConstraints = NO;
    secondImageView.translatesAutoresizingMaskIntoConstraints = NO;
    thirdImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [stackView addArrangedSubview:firstImageView];
    [stackView addArrangedSubview:secondImageView];
    [stackView addArrangedSubview:thirdImageView];
    
    self.scrollView.pagingEnabled = YES;
    
    [NSLayoutConstraint activateConstraints:@[
                                              [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
                                              [stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              [firstImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                              [secondImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                              [thirdImageView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1],
                                              [firstImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              [secondImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              [thirdImageView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1],
                                              ]];
}

-(void)viewTapped:(UITapGestureRecognizer*)sender{
    NSLog(@"tapped");
    UIImageView* iv = (UIImageView*)sender.view;
    self.image = iv.image;
    [self performSegueWithIdentifier:@"detailSegue" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    SecondViewController* dvc = segue.destinationViewController;
    dvc.image = self.image;
}

@end
