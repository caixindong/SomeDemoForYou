//
//  People.m
//  RuntimeDemo
//
//  Created by 蔡欣东 on 16/5/8.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "People.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation People


-(NSDictionary *)getAllProperties{
    unsigned int count = 0;
    NSMutableDictionary* result = [@{} mutableCopy];
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    for (NSUInteger i = 0; i<count; i++) {
        const char* propertyName = property_getName(properties[i]);
        NSString* name = [NSString stringWithUTF8String:propertyName];
        id propertyValue = [self valueForKey:name];
        if (propertyValue) {
            result[name] = propertyValue;
        }else{
            result[name] = @"value 不能为 nil";
        }
        
        
    }
    free(properties);

    return result;
}

-(NSDictionary *)getAllIvars{
    unsigned int count = 0;
    NSMutableDictionary* result = [@{} mutableCopy];
    Ivar* ivars = class_copyIvarList([self class], &count);
    for (NSUInteger i = 0; i<count; i++) {
        const char* ivarName = ivar_getName(ivars[i]);
        NSString* name = [NSString stringWithUTF8String:ivarName];
        id value = [self valueForKey:name];
        if (value) {
            result[name] = value;
        }else{
            result[name] = @"value 不能为 nil";
        }
    }
    free(ivars);
    return  result;
}

-(NSDictionary*)getAllMethods{
    unsigned int count = 0;
    NSMutableDictionary* result = [@{} mutableCopy];
    Method* methods = class_copyMethodList([self class], &count);
    for (NSUInteger i = 0; i<count; i++) {
        const char* methodName = sel_getName(method_getName(methods[i]));
        NSString* name = [NSString stringWithUTF8String:methodName];
        //获取参数列表
        int args = method_getNumberOfArguments(methods[i]);
        result[name] = [NSString stringWithFormat:@"args count is %d",args-2 ];
    }
    free(methods);
    return result;
}



@end
