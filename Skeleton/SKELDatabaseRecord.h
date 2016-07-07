//
//  FSDatabaseRecord.h
//  FSBrochure
//
//  Created by Pryderi on 31/08/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SKELAppDelegate;

@interface SKELDatabaseRecord : NSObject

@property NSString *record_id;

+ (id)recordWithID:(NSString *)recid;
+ (SKELAppDelegate *)appDelegate;
+ (NSArray *)allRecords;

@end
