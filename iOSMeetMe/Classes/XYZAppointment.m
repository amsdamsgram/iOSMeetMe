//
//  XYZAppointment.m
//  iOSMeetMe
//
//  Created by Damien Soulard on 28/11/2013.
//  Copyright (c) 2013 Damien Soulard. All rights reserved.
//

#import "XYZAppointment.h"

@implementation XYZAppointment

- (id)initWithTitle:(NSString *)title name:(NSString *)name andDescription:(NSString *)desc
{
    self = [super init];
    if (self) {
        self.title = title;
        self.date = [self getFormattedDate:[NSDate date]];
        self.startTime = [self getFormattedTime:[NSDate date]];
        self.endTime = [self getFormattedTime:[NSDate date]];
        self.name = name;
        self.desc = desc;
    }

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

- (NSString *)dateToString:(NSDate *)date withDateStyle:(NSDateFormatterStyle)dateStyle andTimeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSDateFormatter localizedStringFromDate:self.startTime
                                                    dateStyle:dateStyle
                                                    timeStyle:timeStyle];
}

@end
