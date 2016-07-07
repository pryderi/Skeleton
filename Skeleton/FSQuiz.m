//
//  FSQuiz.m
//  FlyingSquirrel
//
//  Created by Pryderi on 27/05/2016.
//  Copyright © 2016 Temple. All rights reserved.
//

#import "FSQuiz.h"
#import "SKELAppDelegate.h"

@implementation FSQuiz

+ (id)recordWithID:(NSString *)recid {
    NSArray *quizdata = self.appDelegate.quizzes;
    FSQuiz *quizRecord;
    for (FSQuiz *quiz in quizdata) {
        if ([quiz.record_id isEqualToString:recid]) {
            quizRecord = quiz;
            break;
        }
    }
    return quizRecord;
}

+ (NSArray *)allRecords {
    return self.appDelegate.quizzes;
}

@end
