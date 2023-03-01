#!/bin/env python3 

import moodle_api 
moodle_api.URL = "https://166250.logineonrw-lms.de"
moodle_api.KEY = "ea5268987d351fc1151b777bdb07a53e" 

courses = moodle_api.CourseList()
for course in courses.courses:
    print(f"{course.__dict__['shortname']} {course.__dict__['id']}")


