//
//  Appointment.h
//  iOSMeetMe
//
//  Created by Damien Soulard on 04/12/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Appointment : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) NSDate * endTime;

- (id)initWithTitle:(NSString *)title name:(NSString *)name andDescription:(NSString *)desc;

@end
