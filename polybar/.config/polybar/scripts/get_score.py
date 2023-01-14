#!/bin/env python3

import requests
import time
import math
utc_stamp = 15*math.floor(abs(int(time.time())/15))
meeting_id =7189863
url = f"https://hbde-live.liga.nu/nuScoreLiveRestBackend/api/1/meeting/{meeting_id}/time/{utc_stamp}"
#url =  "https://hbde-live.liga.nu/nuScoreLiveRestBackend/api/1/meeting/7189863/time/1673186775"
#print(url)
meeting = requests.get(url).json()
version =meeting["versionUid"]
events = requests.get(f"https://hbde-live.liga.nu/nuScoreLiveRestBackend/api/1/events/{meeting_id}/versions/{version}").json()["events"]
events.sort(key= lambda elm: int(elm["idx"]))
for event in events:
    min,sec  = divmod(event["second"],60)
    time =f"{min:02d}:{sec:02d}" 
    points = f"{event['pointsHome']}:{event['pointsGuest']}"
    name = ""
    if not event['personLastname'] is None:
        name = f"{event['personFirstname']} {event['personLastname'][0]}."
    match int(event["event"]):
        case 0:
            #print(f"{time}|{points} gestartet")
            pass
        case 1:
            pass
            #print(f"{time}|{points} angehalten")
        case 2:
            print(f"{time}|      Team-Timeout {event['teamHome']}")
        case 3:
            print(f"{time}|      Team-Timeout Gast {event['teamHome']}")
        case 4:
            print(f"{time}|{points:<5} Tor {name}")
        case 5:
            print(f"{time}|{points:<5} 7-Meter Tor {name}")
        case 6:
            print(f"{time}|      7-Meter Versuch {name}")
        case 8:
            print(f"{time}|      Zeitstrafe {name}")
        case 9:
            print(f"{time}|      Gelbe Karte {name}")
        case 11:
            print(f"{time}|      Rote Karte {name}")
        case 14:
            print(f"{time}|      Halbzeit Ende")
        case 15:
            print(f"{time}|      Halbzeit Start")
        case 16:
            print(f"{time}|      Spiel Ende")
        case 17:
            print(f"{time}|      Spiel Start")

        case _:
            print(f"{time}|{points:<5} eventid: {event['event']} {name}")
