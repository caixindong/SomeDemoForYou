//
//  People.h
//  RuntimeDemo
//
//  Created by 蔡欣东 on 16/5/8.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property(nonatomic,copy)NSString* name;
@property(nonatomic,strong)NSNumber* age;


/**
 * 字典 转 Model
 **/
-(instancetype)initWithDictionary:(NSDictionary*) dict;

/**
 * Model转换成字典
 **/
-(NSDictionary*)covertToDictionary;
@end
