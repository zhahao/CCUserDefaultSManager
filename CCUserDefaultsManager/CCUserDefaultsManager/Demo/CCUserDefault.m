//
//  CCUserDefault.m
//  CCUserDefaultsManager
//
//  Created by Zohar on 2017/11/9.
//  Copyright © 2017年 zohar. All rights reserved.
//

#import "CCUserDefault.h"
#import "CCUserDefaultsManager.h"

@interface CCUserDefault()<CCUserDefaultsManager>

@end

@implementation CCUserDefault

+ (CCUserDefault *)sharedManager
{
    static CCUserDefault *_mgr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _mgr = [CCUserDefault new];
    });
    return _mgr;
}

+ (void)load
{
    /// 将CCUserDefault添加到CCUserDefaultsManager中,那么CCUserDefault的成员变量的存取方法都会映射成与`NSUserDefaults`对应的存取方法
    [[CCUserDefaultsManager sharedManager] addClass:self prefix:@"cc_"];
}

+ (NSArray *)cc_blackList
{
    return @[@"ignoreString"];
}

- (NSString *)log
{
    return [NSString stringWithFormat:@"<%@ \n intType: %d, \n floatType: %f,\n doubleType: %f, \n boolType: %d, \n string: %@,\n data: %@,number: %@,\n date: %@,\n array: %@,\n dictionary: %@,\n url: %@, \n ignoreString:%@ ,\n userName: %@>", self.class,self.intType,self.floatType,self.doubleType,self.boolType,self.string,self.data,self.number,self.date,self.array,self.dictionary,self.url,self.ignoreString,self.userName];
}

@end

@implementation CCUserDefault(extension)
@dynamic userName;

@end


