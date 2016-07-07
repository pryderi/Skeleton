//
//  FSTableViewController.m
//  FSBrochure
//
//  Created by Pryderi on 05/09/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import "SKELTableViewController.h"
#import "SKELAppDelegate.h"
#import "SKELTheme.h"
#import "FSQuiz.h"
#import "QuizIntroductionViewController.h"

@interface SKELTableViewController ()

@end

@implementation SKELTableViewController


- (void)viewWillAppear:(BOOL)animated {
    self.theme_id = @"3";
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"FS Table View Controller did appear: %@", self);
    UIInterfaceOrientation newOrientation = [self viewOrientation];
    if (newOrientation != self.currentOrientation) {
        // someone has changed the orientation while I wasn't looking!
        [self applyTheme];
        self.currentOrientation = newOrientation;
    }
    [super viewDidAppear:animated];
}

- (UIInterfaceOrientation)viewOrientation {
    return [UIApplication sharedApplication].statusBarOrientation;
}

- (void)displayContent {
    // format the data, and apply themes to views
    // stick the data onto the page
    // called from view will appearr, and maybe some other places
}

- (void)applyTheme {
    self.tableView.backgroundView = self.backgroundView;
    UIInterfaceOrientation orientation = self.viewOrientation;
    [self.theme colourView:self.backgroundView forOrientation:orientation];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // We need to add a subview for the background
    self.backgroundView = [[UIView alloc] init];
    [self.tableView addSubview:self.backgroundView];
    [self.tableView sendSubviewToBack:self.backgroundView];
}


#pragma mark - view orientation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
     {
         // anything to do after the transition
         [self applyTheme];
     }];
    
    if (self.splitViewController) {
        NSLog(@"Got me split view.  Fukkit. Preferred display mode is %ld;  current display mode is %ld", (long)self.splitViewController.preferredDisplayMode, (long)self.splitViewController.displayMode);
    }
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}


#pragma mark - table data source and delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.quizzes count];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedQuiz = [self.quizzes objectAtIndex:indexPath.row];
    
    //[self showViewController:qIntroViewController sender:self];
    [self performSegueWithIdentifier:@"showQuiz" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"preparing for segue %@", segue);
    QuizIntroductionViewController *qIntroViewController = [segue destinationViewController];
    qIntroViewController.quiz = self.selectedQuiz;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.tableCellIdentifier];
	if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.tableCellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.theme.bkimage) {
        cell.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
        cell.opaque = NO;
    } else {
        cell.backgroundColor = [self.theme UIColorForStyle:FS_THEME_BKGND];
    }
    cell.textLabel.textColor = [self.theme UIColorForStyle:FS_THEME_H1];
    cell.detailTextLabel.textColor = [self.theme UIColorForStyle:FS_THEME_H2];
    
    FSQuiz *quiz = [self.quizzes objectAtIndex:indexPath.row];
    cell.textLabel.text = quiz.name;
    cell.detailTextLabel.text = quiz.tag;
}


- (SKELTheme *)theme {
    if (!_theme) {
        if (self.theme_id) {
            _theme = [SKELTheme recordWithID:self.theme_id];
        }
        // if still didn't get a theme, get a default one.
        if (!_theme) {
            SKELAppDelegate *thisApp = [UIApplication sharedApplication].delegate;
            _theme = [thisApp defaultTheme];  // returns a default one if thre isn't one in the app
        }
    }
    return _theme;
}

- (NSString *)tableCellIdentifier {
    if (!_tableCellIdentifier) {
        _tableCellIdentifier = @"FSTableCell";  // default, unless subclass overrides it
    }
    return _tableCellIdentifier;
}

- (NSArray *)quizzes {
    SKELAppDelegate *appD = [UIApplication sharedApplication].delegate;
    return appD.quizzes;
}

@end
