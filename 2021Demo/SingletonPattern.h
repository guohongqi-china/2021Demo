//
//  SingletonPattern.h
//  2021Demo
//
//  Created by guohongqi on 2021/5/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingletonPattern : NSObject

+ (SingletonPattern *)sharedInstance;
+ (instancetype)shareSettingData;

@end

NS_ASSUME_NONNULL_END
