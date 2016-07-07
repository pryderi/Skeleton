//
//  FSAnswer.h
//  FlyingSquirrel
//
//  Created by Pryderi on 27/05/2016.
//  Copyright © 2016 Temple. All rights reserved.
//

#import "SKELDatabaseRecord.h"

@interface FSAnswer : SKELDatabaseRecord

@property (strong, nonatomic) NSString *question_id;
@property (strong, nonatomic) NSString *answer;
@property (strong, nonatomic) NSString *correct;
@property (strong, nonatomic) NSString *order_by;
@property (strong, nonatomic) NSString *score;
@property (strong, nonatomic) NSDate *created_at;
@property (strong, nonatomic) NSDate *updated_at;


@end



//create_table "answers", force: true do |t|
//t.string   "answer"
//t.boolean  "correct"
//t.integer  "question_id"
//t.integer  "order_by"
//t.datetime "created_at"
//t.datetime "updated_at"
//t.integer  "score"
//end