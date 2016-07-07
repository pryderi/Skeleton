//
//  QuizQuestionViewController.h
//  Skeleton
//
//  Created by Pryderi on 06/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "SKELBaseViewController.h"

@class FSQuiz;

@interface QuizQuestionViewController : SKELBaseViewController

@property (strong, nonatomic) FSQuiz *quiz;
@property (strong, nonatomic) NSString *quiz_id;

@end
