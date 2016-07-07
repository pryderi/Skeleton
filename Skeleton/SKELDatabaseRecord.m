//
//  FSDatabaseRecord.m
//  FSBrochure
//
//  Created by Pryderi on 31/08/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import "SKELDatabaseRecord.h"
#import "SKELAppDelegate.h"


@implementation SKELDatabaseRecord

// This one will be overridden in subclasses
+ (id)recordWithID:(NSString *)recid {
    return nil;
}

+ (SKELAppDelegate *)appDelegate {
    return [UIApplication sharedApplication].delegate;
}

+ (NSArray *)allRecords {
    return [NSArray array];
}

@end
