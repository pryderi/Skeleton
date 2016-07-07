//
//  ViewController.m
//  Skeleton
//
//  Created by Pryderi on 04/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "SKELBaseViewController.h"
#import "SKELTheme.h"

@interface SKELBaseViewController ()

@end

@implementation SKELBaseViewController

- (void)displayContent {
    // format the data, and apply themes to views
    // stick the data onto the page
    // called from view will appear, and maybe some other places
}

- (void)applyTheme {
    UIInterfaceOrientation viewOrientation = [UIApplication sharedApplication].statusBarOrientation;
    [self.theme colourView:self.view forOrientation:viewOrientation];
}


- (UIInterfaceOrientation)viewOrientation {
    return [UIApplication sharedApplication].statusBarOrientation;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         // anything to do after the transition
         [self applyTheme];
     }];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [self displayContent];
    if (!self.currentOrientation) {
        // pick up the orientation if we're appearing for the first time.
        [self applyTheme];
        self.currentOrientation = [self viewOrientation];
    }
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SKELTheme *)theme {
    if (!_theme) {
        _theme = [SKELTheme defaultTheme];
    }
    return _theme;
}

@end
