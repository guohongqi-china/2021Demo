//
//  SingletonPattern.m
//  2021Demo
//
//  Created by guohongqi on 2021/5/19.
//

#import "SingletonPattern.h"

@implementation SingletonPattern

+ (SingletonPattern *)sharedInstance{
    
    static SingletonPattern *manager = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        manager = [[SingletonPattern alloc] init];
    });
    return manager;
    
}

static SingletonPattern *_model;
+ (instancetype)shareSettingData{
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _model = [self new] ;
    });
    return _model;
}

@end
