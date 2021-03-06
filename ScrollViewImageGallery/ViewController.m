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
@property (nonatomic,strong) UIPageControl* pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollView];
    
}

-(void)setupScrollView{
    UIStackView* stackView = [[UIStackView alloc]init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.distribution = UIStackViewDistributionFill;
    
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
    
    UIPageControl* pageControl = [[UIPageControl alloc]initWithFrame:CGRectZero];
    pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    pageControl.tintColor = [UIColor redColor];
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    [self.pageControl addTarget:self action:@selector(pageControlTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [NSLayoutConstraint activateConstraints:@[
                                              [stackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
                                              [stackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor],
                                              [stackView.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor],
                                              [stackView.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor],
                                              [firstImageView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1],
                                              [secondImageView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1],
                                              [thirdImageView.heightAnchor constraintEqualToAnchor:self.scrollView.heightAnchor multiplier:1],
                                              [firstImageView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:1],
                                              [secondImageView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:1],
                                              [thirdImageView.widthAnchor constraintEqualToAnchor:self.scrollView.widthAnchor multiplier:1],
                                              [pageControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
                                              [pageControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0],
                                              [pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20],
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int pageInt = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.pageControl.currentPage = pageInt;
}

-(void)pageControlTapped:(UIPageControl*)sender{
    NSInteger currentPage = sender.currentPage;
    CGFloat width = self.view.frame.size.width;
    switch (currentPage) {
        case 0:
            [self.scrollView setContentOffset:CGPointMake(width * 0, 0)];
            break;
        case 1:
            [self.scrollView setContentOffset:CGPointMake(width * 1, 0)];
            break;
        case 2:
            [self.scrollView setContentOffset:CGPointMake(width * 2, 0)];
            break;
        default:
            break;
    }
}
@end
