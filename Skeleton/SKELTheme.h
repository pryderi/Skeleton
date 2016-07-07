//
//  FSTheme.h
//  FSBrochure
//
//  Created by Pryderi on 31/08/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKELDatabaseRecord.h"


#define FS_THEME_H1 1
#define FS_THEME_H2 2
#define FS_THEME_H3 3
#define FS_THEME_H4 4
#define FS_THEME_TXT 5
#define FS_THEME_BKGND 6
#define FS_THEME_BUTTON 7
#define FS_THEME_BUTTONTXT 8


@interface SKELTheme : NSObject

@property (strong, nonatomic) NSString *record_id;
@property (strong, nonatomic) NSArray *allThemes;

@property(strong, nonatomic) NSString *h1col, *h2col, *h3col, *h4col, *txtcol, *bkgndcol, *bkimage, *buttoncol, *buttontxtcol;
@property int h1size, h2size, h3size, h4size, txtsize, buttontxtsize;
@property int scalefactor;

+ (SKELTheme *)defaultTheme;
- (void)colourView:(UIView *)view forOrientation:(UIInterfaceOrientation)viewOrientation;
- (NSString *)colourForStyle:(int)style;
- (UIColor *)UIColorForStyle:(int)style;
- (int)sizeForStyle:(int)style;
- (void)setDefaults;

+ (SKELTheme *)recordWithID:(NSString *)recid;

@end
