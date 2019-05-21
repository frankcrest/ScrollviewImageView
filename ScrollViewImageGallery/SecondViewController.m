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
@property (nonatomic, strong) UIView* masterView;
@property (nonatomic,strong) UIView* detailView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView* firstImageView = [[UIImageView alloc]initWithImage: self.image ? self.image : [UIImage imageNamed:@"lighthouse"]];
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
    
//    self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.center.y - self.firstImageView.center.y, 0, 0, 0);
    
    UIView* masterView = [[UIView alloc]initWithFrame:CGRectZero];
    masterView.translatesAutoresizingMaskIntoConstraints = NO;
    masterView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview: masterView];
    self.masterView = masterView;
    
    UIView* detailView = [[UIView alloc]initWithFrame:CGRectZero];
    detailView.translatesAutoresizingMaskIntoConstraints = NO;
    detailView.backgroundColor = [UIColor whiteColor];
    [masterView addSubview:detailView];
    self.detailView = detailView;
    
    [NSLayoutConstraint activateConstraints:@[
                                              [firstImageView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [firstImageView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [firstImageView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
                                              [firstImageView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              [masterView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor constant:100],
                                              [masterView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [masterView.widthAnchor constraintEqualToConstant:300],
                                              [masterView.heightAnchor constraintEqualToConstant:200],
                                              [detailView.widthAnchor constraintEqualToConstant:50],
                                              [detailView.heightAnchor constraintEqualToConstant:50],
                                              [detailView.centerXAnchor constraintEqualToAnchor:masterView.centerXAnchor],
                                              [detailView.centerYAnchor constraintEqualToAnchor:masterView.centerYAnchor],
                                              ]];

}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.firstImageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect visibleRect = [self.scrollView convertRect:self.scrollView.bounds toView:self.firstImageView];
    CGFloat originX = visibleRect.origin.x;
    NSLog(@"origin x %f", originX);
    CGFloat originY = visibleRect.origin.y;
    NSLog(@"origin y%f", originY);

    float scaleX = 300 / self.scrollView.contentSize.width;
    NSLog(@"scale x%f", scaleX);
    float scaleY = 200 / self.scrollView.contentSize.height;
    NSLog(@"scale y%f", scaleY);

    CGRect bounds = self.masterView.bounds;
    bounds.origin.x = originX * scaleX - 125;
    bounds.origin.y = originY * scaleY - 75;
    self.masterView.bounds = bounds;
    }


@end
