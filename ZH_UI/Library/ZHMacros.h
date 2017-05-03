//
//  ZHMacros.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 15.09.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#define HZEmpty

#define ZHEmpty

#define ZHPerformBlock(block, ...) \
    do { \
        if (block) { \
        block(__VA_ARGS__); \
        } \
    } while(0) \


#define ZHWeakify(variable) \
__weak __typeof(variable) __ZHWeakified_##variable = variable;

#define ZHStrongify(variable) \
__strong __typeof(variable) variable = __ZHWeakified_##variable;


#define ZHDefineBaseViewProrety(propertyName, viewClass) \
@property (nonatomic, readonly) viewClass *propertyName;

#define ZHBaseViewGetterSyntesize(selector, viewClass) \
- (viewClass *)selector { \
    if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
    return (viewClass *)self.view; \
    } \
    \
    return nil; \
}


#define ZHViewControllerBaseViewPropertyWithGetter(viewControllerClass,baseViewClass, propertyName ) \
    @interface viewControllerClass (__ZHPrivatBaseView) \
    ZHDefineBaseViewProrety(propertyName, baseViewClass)\
    \
    @end \
    \
    @implementation viewControllerClass (__ZHPrivatBaseView) \
    \
    @dynamic propertyName; \
    \
    ZHBaseViewGetterSyntesize(propertyName, baseViewClass)\
    \
    @end

#define ZHConstant(type, name, value) \
    static const type name = value;


#define ZHStringConstantWithValue(name, value) \
    static NSString * const name = @#value


#define ZHStringConstant(name) \
    static NSString * const name = @#name

#define ZHReturnOnce(type, variable, block)  \
    do {\
        static dispatch_once_t onceToken; \
        static type *variable = nil; \
        dispatch_once(&onceToken, ^{ \
        if (block) { \
        variable = block(); \
        } \
        }); \
        \
        return variable; \
        \
    } while (0)

#define ZHStrongifyAndReturnIfNil(variable) \
    ZHStrongifyAndReturnResultIfNil(variable, ZHEmpty)

#define ZHStrongifyAndReturnNilIfNil(variable) \
    ZHStrongifyAndReturnResultIfNil(variable, nil)

#define ZHStrongifyAndReturnResultIfNil(variable, result) \
    ZHStrongify(variable); \
    if (!variable) { \
        return result; \
    }

#define ZHValueBlock(block, variable, ...) \
    if (block) { \
    variable = block(__VA_ARGS__); \
    }


#define ZHReturnSharedInstance(variable) \
    static id sharedInstance = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        sharedInstance = variable; \
    }); \
    \
    return sharedInstance;

#define ZHReturnSharedInstanceWithBlock(block) \
    static id sharedInstance = nil; \
    static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        ZHValueBlock(block, sharedInstance); \
    }); \
    \
    return sharedInstance;

