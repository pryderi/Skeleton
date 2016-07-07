//
//  SKELTheme.m
//  FSBrochure
//
//  Created by Pryderi on 31/08/2013.
//  Copyright (c) 2013 Templecom. All rights reserved.
//

#import "SKELTheme.h"
#import "SKELAppDelegate.h"

@implementation SKELTheme




+ (SKELTheme *)defaultTheme {
    SKELTheme *newTheme;
    SKELAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    newTheme = [appDelegate defaultTheme];
    if (!newTheme) {
        // last resort - create a theme from scratch.
        newTheme = [[SKELTheme alloc] init];
        [newTheme setDefaults];
    }
    return newTheme;
}

- (void)colourView:(UIView *)view forOrientation:(UIInterfaceOrientation)viewOrientation {
    if (self.bkimage) {
        if ([self.bkimage rangeOfString:@"GRAD:"].location == 0) {
            // for example GRAD:9FB6CD_3B3B3B_0
            NSRange r1 = {.location = 6, .length = 6};
            NSString *col1 = [self.bkimage substringWithRange:r1];
            NSRange r2 = {.location = 12, .length = 6};
            NSString *col2 = [self.bkimage substringWithRange:r2];
            UIColor *uicol1 = [self UIColorForHexval:col1];
            UIColor *uicol2 = [self UIColorForHexval:col2];
            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = view.bounds;
            gradient.colors = [NSArray arrayWithObjects:(id)[uicol1 CGColor], (id)[uicol2 CGColor], nil];
            [view.layer insertSublayer:gradient atIndex:0];
        } else {
            // not implemented in skeleton vwerion
        }
    } else {
        [view setBackgroundColor:[self UIColorForStyle:FS_THEME_BKGND]];
    }
}

- (id)init {
    self = [super init];
    [self setDefaults];
    return self;
}

- (void)setDefaults {
    
    self.h1col = @"FF00CC";
    self.h2col = @"FF00CC";
    self.h3col = @"FF00CC";
    self.h4col = @"FF00CC";
    self.txtcol = @"FF00CC";
    self.bkgndcol = @"CCCCCC";
    self.bkimage = nil;
    self.buttoncol = @"FF0000";   // red buttons
    self.buttontxtcol = @"FFFFFF"; // white button text
    
    self.h1size = 24;
    self.h2size = 20;
    self.h3size = 18;
    self.h4size = 12;
    self.txtsize = 12;
    self.buttontxtsize = 12;
    self.scalefactor = 1;
}

- (NSString *)colourForStyle:(int)style {
    
    // will prepend a hash char to make it a legal color format
    NSString *col;
    switch (style) {
		case FS_THEME_H1:
			col = self.h1col;
			break;
		case FS_THEME_H2:
			col = self.h2col;
			break;
		case FS_THEME_H3:
			col = self.h3col;
			break;
		case FS_THEME_H4:
			col = self.h4col;
			break;
		case FS_THEME_TXT:
			col = self.txtcol;
			break;
		case FS_THEME_BKGND:
			col = self.bkgndcol;
			break;
		case FS_THEME_BUTTON:
			col = self.buttoncol;
			break;
		case FS_THEME_BUTTONTXT:
			col = self.buttontxtcol;
			break;
		default:
			col = @"000000";
			break;
    }
    return [@"#" stringByAppendingString:col];
}

- (UIColor *)UIColorForStyle:(int)style {
    NSString *colString = [self colourForStyle:style];
    NSString *cleanString = [colString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    return [self UIColorForHexval:cleanString];
}

- (UIColor *)UIColorForHexval:(NSString *)hexcol {
    NSString *hexcolWithAlpha = [hexcol stringByAppendingString:@"ff"];
    unsigned int baseValue;
    [[NSScanner scannerWithString:hexcolWithAlpha] scanHexInt:&baseValue];
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (int)sizeForStyle:(int)style {
    
    int size;
    switch (style) {
		case FS_THEME_H1:
			size = self.h1size;
			break;
		case FS_THEME_H2:
			size = self.h2size;
			break;
		case FS_THEME_H3:
			size = self.h3size;
			break;
		case FS_THEME_H4:
			size = self.h4size;
			break;
		case FS_THEME_TXT:
			size = self.txtsize;
			break;
		case FS_THEME_BKGND:
			size = 0;  // not relevant!
			break;
		case FS_THEME_BUTTON:
			size = 0;  // not relevant!
			break;
		case FS_THEME_BUTTONTXT:
			size = self.buttontxtsize;
			break;
		default:
			size = 0;
			break;
    }
    return size * self.scalefactor;
}


// this just creates some dummy theme data.
// Three themes are availbe - 1,2,3.  Any other id just returns a default record.
+ (SKELTheme *)recordWithID:(NSString *)recid {
    SKELTheme *themeRecord = [[SKELTheme alloc] init];  // default theme
    if ([recid isEqualToString:@"1"]) {
        themeRecord.h1col = @"0022FF";
        themeRecord.h2col = @"0022FF";
        themeRecord.h3col = @"0022FF";
        themeRecord.h4col = @"0022FF";
        themeRecord.txtcol = @"0022FF";
        themeRecord.bkgndcol = @"FFFFFF";
        themeRecord.bkimage = nil;
        themeRecord.buttoncol = @"FF0000";   // red buttons
        themeRecord.buttontxtcol = @"FFFFFF"; // white button text
    } else if ([recid isEqualToString:@"2"]) {
        themeRecord.h1col = @"003000";
        themeRecord.h2col = @"003000";
        themeRecord.h3col = @"003000";
        themeRecord.h4col = @"003000";
        themeRecord.txtcol = @"003000";
        themeRecord.bkgndcol = @"FFBBFF";
        themeRecord.bkimage = @"GRAD:9FB6CD_3B3B3B_0";
        themeRecord.buttoncol = @"113310";
        themeRecord.buttontxtcol = @"003000";
    } else if ([recid isEqualToString:@"3"]) {
        themeRecord.h1col = @"00000F";
        themeRecord.h2col = @"00000F";
        themeRecord.h3col = @"00000F";
        themeRecord.h4col = @"00000F";
        themeRecord.txtcol = @"00000F";
        themeRecord.bkgndcol = @"FF6347";
        themeRecord.bkimage = @"GRAD:FFFFF0_FF6347_0";
        themeRecord.buttoncol = @"00000F";   // red buttons
        themeRecord.buttontxtcol = @"00000F"; // white button text
    } else if ([recid isEqualToString:@"3"]) {
        themeRecord.h1col = @"070700";
        themeRecord.h2col = @"070700";
        themeRecord.h3col = @"070700";
        themeRecord.h4col = @"070700";
        themeRecord.txtcol = @"070700";
        themeRecord.bkgndcol = @"FFC1C1";
        themeRecord.bkimage = @"GRAD:F8F8FF_FFC1C1_0";
        themeRecord.buttoncol = @"070700";   // red buttons
        themeRecord.buttontxtcol = @"070700"; // white button text
    }
    return themeRecord;
}

@end
