//
//  FSQuiz.h
//  FlyingSquirrel
//
//  Created by Pryderi on 27/05/2016.
//  Copyright © 2016 Temple. All rights reserved.
//

#import "SKELDatabaseRecord.h"

@interface FSQuiz : SKELDatabaseRecord

// inherits record_id property from superclass

@property (strong, nonatomic) NSString *tag;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *theme_id;

@end




//create_table "quizzes", force: true do |t|
//t.integer  "smartapp_id"
//t.string   "name"
//t.string   "tag"
//t.text     "description", limit: 16777215
//t.integer  "theme_id"
//t.datetime "created_at"
//t.datetime "updated_at"
//t.integer  "order_by"
//t.string   "parent_type"
//t.integer  "parent_id"
//t.integer  "scid"