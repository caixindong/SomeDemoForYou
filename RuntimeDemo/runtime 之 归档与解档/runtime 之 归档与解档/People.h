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
@end
