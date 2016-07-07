//
//  QuizIntroductionViewController.m
//  Skeleton
//
//  Created by Pryderi on 06/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "QuizIntroductionViewController.h"
#import "FSQuiz.h"
#import "SKELTheme.h"

@interface QuizIntroductionViewController ()

@end

@implementation QuizIntroductionViewController


- (void)displayContent {
    [self.quizSummary setText:self.quiz.summary];
}

- (void)applyTheme {

    [super applyTheme];
    [self.quizSummary setTextColor:[self.theme UIColorForStyle:FS_THEME_TXT]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.theme = [SKELTheme recordWithID:self.quiz.theme_id];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
