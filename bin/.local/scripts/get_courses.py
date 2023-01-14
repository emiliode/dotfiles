#!/bin/env python3 

import moodle_api 
moodle_api.URL = "https://166250.logineonrw-lms.de"
moodle_api.KEY = "6cfb4c20849576bb03f951ec45fc0b21" 

courses = moodle_api.CourseList()
for course in courses.courses:
    print(f"{course.__dict__['shortname']} {course.__dict__['id']}")

print("HALLO")

