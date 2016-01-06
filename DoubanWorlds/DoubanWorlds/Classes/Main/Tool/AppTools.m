//
//  AppTools.m
//  DoubanWorlds
//
//  Created by LYoung on 15/12/23.
//  Copyright © 2015年 LYoung. All rights reserved.
//

#import "AppTools.h"

@implementation AppTools

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    
    // strip 0X if it appears
    
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    
    range.location = 0;
    
    range.length = 2;
    
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
            
                           green:((float) g / 255.0f)
            
                            blue:((float) b / 255.0f)
            
                           alpha:1.0f];
    
}

+ (NSMutableAttributedString *)setLineSpacingWith:(NSString *)contentText lineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:contentText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentText length])];
    return attributedString;
}

+ (NSString *)formatCount:(NSString *)count{
    NSString *title;
    // 1.得出title的内容
    if ([count intValue] >= 10000) {
        NSString *old = [NSString stringWithFormat:@"%.1f万", [count intValue]/10000.0];
        // 将.0换成空串
        title = [old stringByReplacingOccurrencesOfString:@".0" withString:@""];
    } else if (count != 0) {
        title = [NSString stringWithFormat:@"%d", [count intValue]];
    }
    return title;
}

+ (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (float)formatRating:(NSString *)rating{
    float ratingInt = [rating floatValue]*0.5;
    NSLog(@"bbbbbbbbbbb = %f",[rating floatValue]);

    if (ratingInt > 0.000000 && ratingInt <= 0.5) {
        return 0.5;
    }else if(ratingInt > 0.500000 && ratingInt <= 1.000000){
        return 1;
    }else if(ratingInt > 1.000000 && ratingInt <= 1.500000){
        return 1.5;
    }else if(ratingInt > 1.500000 && ratingInt <= 2.000000){
        return 2;
    }else if(ratingInt > 2.000000 && ratingInt <= 2.500000){
        return 2.5;
    }else if(ratingInt > 2.500000 && ratingInt <= 3.000000){
        return 3;
    }else if(ratingInt > 3.000000 && ratingInt <= 3.500000){
        return 3.5;
    }else if(ratingInt > 3.500000 && ratingInt <= 4.000000){
        return 4;
    }else if(ratingInt > 4.000000 && ratingInt <= 4.500000){
        return 4.5;
    }else{
        return 5;
    }
    
}

@end
