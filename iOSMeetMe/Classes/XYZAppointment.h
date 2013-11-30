//
//  XYZAppointment.h
//  iOSMeetMe
//
//  Created by Damien Soulard on 28/11/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZAppointment : NSObject

@property NSString *title;
@property NSDate *date;
@property NSDate *startTime;
@property NSDate *endTime;
@property NSString *name;
@property NSString *desc;

- (id)initWithTitle:(NSString *)title name:(NSString *)name andDescription:(NSString *)desc;

- (NSString *)dateToString:(NSDate *)date withDateStyle:(NSDateFormatterStyle)dateStyle andTimeStyle:(NSDateFormatterStyle)timeStyle;

@end
