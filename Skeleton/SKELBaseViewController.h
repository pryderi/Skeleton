//
//  ViewController.h
//  Skeleton
//
//  Created by Pryderi on 04/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKELTheme;

@interface SKELBaseViewController : UIViewController

@property (strong, nonatomic) NSString *themeId;
@property (strong, nonatomic) SKELTheme *theme;
@property UIInterfaceOrientation currentOrientation;

- (void)displayContent;     // set text etc to display the content
- (void)applyTheme;         // sets background colour; override to set colour of other objects

@end


