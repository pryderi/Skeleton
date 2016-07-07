//
//  QuizIntroductionViewController.h
//  Skeleton
//
//  Created by Pryderi on 06/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "SKELBaseViewController.h"

@class FSQuiz;

@interface QuizIntroductionViewController : SKELBaseViewController

@property(strong, nonatomic)FSQuiz *quiz;
@property(strong, nonatomic)NSString *quiz_id;


@property (weak, nonatomic) IBOutlet UILabel *quizSummary;
@property (weak, nonatomic) IBOutlet UIButton *startQuizButton;

@end
