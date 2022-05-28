#!/usr/bin/env python
"""Parse workspaces from swaymsg"""
import subprocess
import json

def get_workspaces():
    """fetch the workspace json object from swaymsg"""
    return json.loads(subprocess.check_output(["swaymsg", "-t", "get_workspaces"]))

def list_names():
    """list workspace names"""
    return [i['name'] for i in get_workspaces()]

def print_for_dmenu():
    """print for dmenu"""
    print('\n'.join(list_names()))

print_for_dmenu()
