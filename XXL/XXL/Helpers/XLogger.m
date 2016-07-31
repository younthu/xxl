//
//  Logger.m
//  XXL
//
//  Created by Zhiyong Yang on 7/31/16.
//  Copyright © 2016 Andrew Yang. All rights reserved.
//

#import "XLogger.h"

#ifdef DEBUG
#define LoggerWithTag(tag,level, ...)         LogMessageF(__FILE__, __LINE__, __FUNCTION__, tag, level, __VA_ARGS__)
#else
#define LoggerWithTag(...)                while(0) {}

#endif
@implementation XLogger
- (void)logWithTag:(NSString*)tag andLevel:(int)level info:(NSString*)info{
    LoggerWithTag(tag, level, @"%@", info);
}
@end
