//
//  People.h
//  runtime 之 消息动态解析(一)
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property(nonatomic,copy)NSString* name;

/** m文件不实现方法，通过runtime动态添加方法
 *  通过resolveInstanceMethod：方法决定是否动态添加方法。
    如果返回Yes则通过class_addMethod动态添加方法，消息得到处理，结束；如果返回No
 **/
-(void)sing;

@end
