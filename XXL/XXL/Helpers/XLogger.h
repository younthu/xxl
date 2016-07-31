//
//  Logger.h
//  XXL
//
//  Created by Zhiyong Yang on 7/31/16.
//  Copyright © 2016 Andrew Yang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSLogger/NSLogger.h>



@interface XLogger : NSObject
- (void)logWithTag:(NSString*)tag andLevel:(int)level info:(NSString*)info;
@end
