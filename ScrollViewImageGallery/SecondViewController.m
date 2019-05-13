//
//  SecondViewController.m
//  ScrollViewImageGallery
//
//  Created by Frank Chen on 2019-05-13.
//  Copyright © 2019 Frank Chen. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView* firstImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* firstImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed: @"lighthouse"]];
    firstImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:firstImageView];
    self.firstImageView = firstImageView;
    
    //set contentsize
    self.scrollView.contentSize = self.firstImageView.frame.size;
    //set minZoom which is equal to the whole image showing
    CGFloat minZoom = self.scrollView.frame.size.width / self.firstImageView.frame.size.width;
    //set zoomScale
    self.scrollView.minimumZoomScale = minZoom;
    self.scrollView.maximumZoomScale = 1;
    //set originalscale = full image
    self.scrollView.zoomScale = minZoom;
    
    [NSLayoutConstraint activateConstraints:@[
                                              [firstImageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [firstImageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [firstImageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
                                              [firstImageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              ]];

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.firstImageView;
}


@end
