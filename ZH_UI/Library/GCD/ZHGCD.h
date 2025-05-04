//
//  ZHGCD.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ZHGCDBlock)();

typedef enum {
    ZHDispatchQueuePriorityHigh        = DISPATCH_QUEUE_PRIORITY_HIGH,
    ZHDispatchQueuePriorityDefault     = DISPATCH_QUEUE_PRIORITY_DEFAULT,
    ZHDispatchQueuePriorityLow         = DISPATCH_QUEUE_PRIORITY_LOW,
    ZHDispatchQueuePriorityBackground  = DISPATCH_QUEUE_PRIORITY_BACKGROUND,
} ZHDispatchQueuePriorityType;

typedef enum {
    ZHBlockExecutionSynchronous,
    ZHBlockExecutionAsynchronous
} ZHBlockExecutionType;


void ZHPerformAsyncBlockOnMainQueue(ZHGCDBlock block);
void ZHPerformSyncBlockOnMainQueue(ZHGCDBlock block);

void ZHPerformAsyncBlockOnBackgroundQueue(ZHGCDBlock block);
void ZHPerformSyncBlockOnBackgroundQueue(ZHGCDBlock block);

void ZHPerformAsyncBlockOnLowQueue(ZHGCDBlock block);
void ZHPerformSyncBlockOnLowQueue(ZHGCDBlock block);

dispatch_queue_t ZHDisptchQueueWithPriorityType(ZHDispatchQueuePriorityType type);
