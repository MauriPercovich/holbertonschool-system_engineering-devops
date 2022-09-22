#!/usr/bin/python3
""""""

import json
import requests


def number_of_subscribers(subreddit):
    """API"""

    """identify"""
    headers = {'User-Agent': 'MyAPI'}

    res = requests.get("https://www.reddit.com/r/{}/about.json"
                       .format(subreddit),
                       headers=headers, allow_redirects=False)
    if res.status_code == 200:
        return res.json()['data']['subscribers']
    return 0
