//
//  FSQuestion.h
//  FlyingSquirrel
//
//  Created by Pryderi on 27/05/2016.
//  Copyright © 2016 Temple. All rights reserved.
//

#import "SKELDatabaseRecord.h"

@interface FSQuestion : SKELDatabaseRecord

@property (strong, nonatomic) NSString *quiz_id;
@property (strong, nonatomic) NSString *question;
@property (strong, nonatomic) NSString *explanation;
@property (strong, nonatomic) NSString *weight;
@property (strong, nonatomic) NSString *answers_count;

@end
