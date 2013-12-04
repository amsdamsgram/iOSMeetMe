//
//  Appointment.m
//  iOSMeetMe
//
//  Created by Damien Soulard on 04/12/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import "Appointment.h"


@implementation Appointment

@dynamic title;
@dynamic name;
@dynamic desc;
@dynamic date;
@dynamic startTime;
@dynamic endTime;

- (id)initWithTitle:(NSString *)title name:(NSString *)name andDescription:(NSString *)desc
{
    self.title = title;
    self.date = [self getFormattedDate:[NSDate date]];
    self.startTime = [self getFormattedTime:[NSDate date]];
    self.endTime = [self getFormattedTime:[NSDate date]];
    self.name = name;
    self.desc = desc;
    
    return self;
}

- (NSDate *)getFormattedDate:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSMonthCalendarUnit|NSDayCalendarUnit|NSYearCalendarUnit
                                    fromDate:date];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSDate *)getFormattedTime:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components:NSHourCalendarUnit|NSMinuteCalendarUnit
                                    fromDate:date];
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}


@end
