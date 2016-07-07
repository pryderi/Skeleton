//
//  FSTableViewController.h
//  FSBrochure
//
//  Created by Pryderi on 05/09/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import <UIKit/UIKit.h>


// This isa class that uses themes for formatting
// It is intended to be subclassed

@class SKELTheme;
@class FSQuiz;

@interface SKELTableViewController : UITableViewController

// These need to be inherited by all subclasses
@property (strong, nonatomic) SKELTheme *theme;
@property (strong, nonatomic) NSString *tableCellIdentifier;
@property (strong, nonatomic) NSString *theme_id;
@property (strong, nonatomic) UIView *backgroundView;

@property (weak, nonatomic) NSArray *quizzes;
@property (strong, nonatomic) FSQuiz *selectedQuiz;

@property UIInterfaceOrientation currentOrientation;

- (void)applyTheme;
- (UIInterfaceOrientation)viewOrientation;

@end
