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




-(instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        for (NSString* key in dict) {
            id val = dict[key];
            SEL setter = [self propertySetterByKey:key];
            if (setter) {
                objc_msgSend(self, setter,val);
            }
        }
    }
    return self;
}

-(NSDictionary *)covertToDictionary{
    unsigned int count = 0;
    objc_property_t* properties = class_copyPropertyList([self class], &count);
    
    if (count!=0) {
        NSMutableDictionary* result = [@{} mutableCopy];
        for (NSUInteger i = 0; i<count; i++) {
            const char * propertyName = property_getName(properties[i]);
            NSString* name = [NSString stringWithUTF8String:propertyName];
            
            SEL getter = [self propertyGetterByKey:name];
            if (getter) {
                id value = objc_msgSend(self, getter);
                if (value) {
                    result[name] = value;
                }else{
                    result[name] = @"value 为 nil";
                }
            }
        }
        free(properties);
        return result;
    }
    free(properties);
    return nil;
}

#pragma mark - 生成setter
-(SEL)propertySetterByKey:(NSString*)key{
    //key的首字母大写
    NSString* propertySetterName = [NSString stringWithFormat:@"set%@:",key.capitalizedString];
    SEL setter = NSSelectorFromString(propertySetterName);
    if ([self respondsToSelector:setter]) {
        return setter;
    }
    return nil;
}

-(SEL)propertyGetterByKey:(NSString*)key{
    SEL getter = NSSelectorFromString(key);
    if ([self respondsToSelector:getter]) {
        return getter;
    }
    return nil;
}

@end
