//
//  People+testCategory.m
//  RuntimeDemo
//
//  Created by 蔡欣东 on 16/5/8.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import "People+testCategory.h"
#import <objc/runtime.h>
#import <objc/message.h>


@implementation People (testCategory)

-(void)setAddress:(NSString *)address{
    objc_setAssociatedObject(self, @selector(address), address, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(NSString *)address{
    return objc_getAssociatedObject(self, @selector(address));
}

-(void)setBlock:(CallBackSomething)block{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(CallBackSomething)block{
    return objc_getAssociatedObject(self, @selector(block));
}

@end
