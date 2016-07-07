//
//  AppDelegate.m
//  Skeleton
//
//  Created by Pryderi on 04/07/2016.
//  Copyright © 2016 TempleDynamic. All rights reserved.
//

#import "SKELAppDelegate.h"
#import "SKELTheme.h"
#import "FSQuiz.h"
#import "FSQuestion.h"
#import "FSAnswer.h"

@interface SKELAppDelegate ()

@end

@implementation SKELAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"quizData.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
        plistPath = [[NSBundle mainBundle] pathForResource:@"quizData" ofType:@"plist"];
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSError *error;
    NSArray *quizdata = [NSPropertyListSerialization propertyListWithData:plistXML
                                                                   options:0
                                                                    format:&format
                                                                     error:&error];
    if (!quizdata) {
        NSLog(@"Error reading updates queue plist: %@, format: %d", errorDesc, (int)format);
    } else {
        
        NSMutableArray *quizDataArray = [NSMutableArray arrayWithCapacity:10];
        NSMutableArray *questionsDataArray = [NSMutableArray arrayWithCapacity:30];
        NSMutableArray *answersDataArray = [NSMutableArray arrayWithCapacity:100];
        
        int qzid = 1;
        int qid = 1;
        int aid = 1;
        for (NSDictionary *quiz in quizdata) {
            
            FSQuiz *qz = [[FSQuiz alloc] init];
            qz.record_id = [NSString stringWithFormat:@"%d", qzid++];
            qz.name = [quiz objectForKey:@"name"];
            qz.tag = [quiz objectForKey:@"tag"];
            qz.summary = [quiz objectForKey:@"summary"];
            qz.theme_id = [quiz objectForKey:@"theme_id"];
            [quizDataArray addObject:qz];
            
            NSArray *questions = [quiz objectForKey:@"questions"];
            for (NSDictionary *question in questions) {
                FSQuestion *q = [[FSQuestion alloc] init];
                q.record_id = [NSString stringWithFormat:@"%d", qid++];
                q.quiz_id = qz.record_id;
                q.question = [question objectForKey:@"question"];
                [questionsDataArray addObject:q];
                
                NSArray *answers = [question objectForKey:@"answers"];
                for (NSDictionary *answer in answers){
                    FSAnswer *a = [[FSAnswer alloc] init];
                    a.record_id = [NSString stringWithFormat:@"%d", aid++];
                    a.question_id = q.record_id;
                    a.answer = [answer objectForKey:@"answer"];
                    a.correct = [answer objectForKey:@"correct"];
                    [answersDataArray addObject:answers];
                }
            }
            
        }
        self.quizzes = [quizDataArray copy];
    }
    return YES;
}

-(SKELTheme *)defaultTheme {
    SKELTheme *deftheme = [[SKELTheme alloc] init];
    [deftheme setDefaults];
    return deftheme;
}

@end
