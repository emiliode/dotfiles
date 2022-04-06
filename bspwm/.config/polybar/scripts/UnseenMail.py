#!/usr/bin/env python3
from __future__ import print_function
from httplib2 import Http

import imaplib
import os
import configparser

dirname = os.path.split(os.path.abspath(__file__))[0]
accounts = configparser.RawConfigParser()
accounts.read(os.path.abspath(dirname + '/accounts.ini'))
strFormatted = ""


def check_imap(imap_account):
    if imap_account["useSSL"] == "true":
        client = imaplib.IMAP4_SSL(imap_account["host"], int(imap_account["port"]))
    else:
        client = imaplib.IMAP4(imap_account["host"], int(imap_account["port"]))
    client.login(imap_account["login"], imap_account["password"])
    if "folder" in imap_account:
        client.select(imap_account["folder"])
    else:
        client.select()
    return len(client.search(None, 'UNSEEN')[1][0].split())

unread_sum=0
for account in accounts:
    currentAccount = accounts[account]
    if account == "DEFAULT":
        continue
    if not currentAccount["icon"]:
        icon = accounts["DEFAULT"]["icon"]
    else:
        icon = currentAccount["icon"]
    if currentAccount['protocol'] == "GmailAPI":
        print("GMAIL not supported")
    else:
        unread = check_imap(currentAccount)
        unread_sum+=unread
print(accounts["DEFAULT"]["icon"]+" "+str(unread_sum))
