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

//归档
-(void)encodeWithCoder:(NSCoder *)aCoder{
    unsigned int count = 0;
    Ivar* ivars = class_copyIvarList([self class],&count);
    for (NSUInteger i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char* name = ivar_getName(ivar);
        NSString* key = [NSString stringWithUTF8String:name];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    free(ivars);
}

//解档
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar* ivars = class_copyIvarList([self class],&count);
        for (NSUInteger i = 0; i<count; i++) {
            Ivar ivar = ivars[i];
            const char* name = ivar_getName(ivar);
            NSString* key = [NSString stringWithUTF8String:name];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
    }
    return self;
}

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
