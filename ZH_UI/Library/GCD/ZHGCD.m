//
//  ZHGCD.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 29.03.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHGCD.h"

#pragma mark -
#pragma mark Private declarations

void ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionType type, ZHGCDBlock block);

void ZHPefromBlockWithQueueAndType(ZHBlockExecutionType type, dispatch_queue_t queue, ZHGCDBlock block);

#pragma mark -
#pragma mark Public implementations

void ZHPerformAsyncBlockOnMainQueue(ZHGCDBlock block) {
    ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionAsynchronous, block);
}

void ZHPerformSyncBlockOnMainQueue(ZHGCDBlock block) {
    ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionSynchronous, block);
}

void ZHPerformAsyncBlockOnBackgroundQueue(ZHGCDBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionAsynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityBackground),
                                   block);
}

void ZHPerformSyncBlockOnBackgroundQueue(ZHGCDBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionSynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityBackground),
                                   block);
}

void ZHPerformAsyncBlockOnLowQueue(ZHGCDBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionAsynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityLow),
                                   block);
}

void ZHPerformSyncBlockOnLowQueue(ZHGCDBlock block) {
    ZHPefromBlockWithQueueAndType(ZHBlockExecutionSynchronous,
                                   ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityLow),
                                   block);
}

dispatch_queue_t ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityType type) {
    return dispatch_get_global_queue(type, 0);
}

#pragma mark -
#pragma mark Private implementations

void ZHPerformBlockOnMainQueueWithTypeAndBlock(ZHBlockExecutionType type, ZHGCDBlock block) {
    if ([NSThread isMainThread]) {
        block();
    } else {
        ZHPefromBlockWithQueueAndType(type, dispatch_get_main_queue(), block);
    }
}

void ZHPefromBlockWithQueueAndType(ZHBlockExecutionType type, dispatch_queue_t queue, ZHGCDBlock block) {
    if (!block) {
        return;
    }
    
    switch (type) {
        case ZHBlockExecutionSynchronous:
            dispatch_sync(queue, block);
            break;
            
        case ZHBlockExecutionAsynchronous:
            dispatch_async(queue, block);
            break;
            
        default:
            break;
    }
}
