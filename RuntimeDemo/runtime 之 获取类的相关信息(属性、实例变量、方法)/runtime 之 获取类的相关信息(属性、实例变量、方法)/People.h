//
//  People.h
//  RuntimeDemo
//
//  Created by 蔡欣东 on 16/5/8.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject<NSCoding>{
    
    NSString* _nationality;

}

@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)NSNumber* age;

/**
 * 获取所有属性
 **/
-(NSDictionary*)getAllProperties;

/**
 * 获取所有实例变量
 **/
-(NSDictionary*)getAllIvars;


/**
 * 获取所有方法
 **/
-(NSDictionary*)getAllMethods;

@end
