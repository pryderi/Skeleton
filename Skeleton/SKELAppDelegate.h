//
//  AppDelegate.h
//  Skeleton
//
//  Created by Pryderi on 04/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SKELTheme;

@interface SKELAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSArray *quizzes;
@property (strong, nonatomic) NSArray *questions;
@property (strong, nonatomic) NSArray *answers;


-(SKELTheme *)defaultTheme;

@end

