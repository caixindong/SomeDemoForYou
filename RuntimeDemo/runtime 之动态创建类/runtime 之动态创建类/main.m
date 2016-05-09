//
//  main.m
//  runtime 之动态创建类
//
//  Created by 蔡欣东 on 16/5/9.
//  Copyright © 2016年 蔡欣东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>
void sayFunction(id self, SEL _cmd, id some){
    
    NSLog(@"%@岁的%@说：%@",object_getIvar(self, class_getInstanceVariable([self class], "_age")),object_getIvar(self, class_getInstanceVariable([self class], "_name")),some);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //动态创建类
        Class MyPeople = objc_allocateClassPair([NSObject class], "Person", 0);
        
        //为类添加成员变量
        class_addIvar(MyPeople, "_name", sizeof(NSString*), log2(sizeof(NSString*)), @encode(NSString*));
        class_addIvar(MyPeople, "_age", sizeof(int),sizeof(int),@encode(int));
        
        //注册方法
        SEL say = sel_registerName("say:");
        class_addMethod(MyPeople, say, (IMP)sayFunction, "v@:@");
        
        //注册类
        objc_registerClassPair(MyPeople);
        
        //创建实例对象
        id peopleInstance = [[MyPeople alloc]init];
        
        [peopleInstance setValue:@"李明" forKey:@"name"];
        
        //获取成员变量
        Ivar age = class_getInstanceVariable(MyPeople, "_age");
        object_setIvar(peopleInstance, age, @18);
        
        //发送消息
        objc_msgSend(peopleInstance,say,@"你好呀");
        
        //销毁实例对象
        peopleInstance = nil;
        
        //当类或子类的实例存在，则不能销毁类
        objc_disposeClassPair(MyPeople);
    }
    return 0;
}
