//
//  QuizQuestionViewController.m
//  Skeleton
//
//  Created by Pryderi on 06/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "QuizQuestionViewController.h"
#import "FSQuiz.h"
#import "SKELTheme.h"


@interface QuizQuestionViewController ()

@end

@implementation QuizQuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.quiz = [FSQuiz recordWithID:self.quiz_id];
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
