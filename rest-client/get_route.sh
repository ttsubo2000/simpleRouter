#!/usr/bin/env python
#-*- coding: utf-8 -*-

from common_func import request_info

###############
# get_route
###############

def start_get_route(dpid):
    operation = "get_route"
    url_path = "/openflow/" + dpid + "/route" 
    method = "GET"

    route_list = request_info(operation, url_path, method, "")

    prefix = {}
    nextHopIpAddr = {}
    nowtime = route_list['time']
    print "+++++++++++++++++++++++++++++++"
    print "%s : RoutingTable " % nowtime
    print "+++++++++++++++++++++++++++++++"

    print "prefix             nexthop"
    print "------------------ ----------------"
    for a in range(len(route_list['route'])):
        prefix[a] = route_list['route'][a]['prefix']
        nextHopIpAddr[a] = route_list['route'][a]['nextHopIpAddr']
        print "%-18s %-15s" % (prefix[a], nextHopIpAddr[a])
        

##############
# main
##############

def main():
    dpid = "0000000000000001"
    start_get_route(dpid)


if __name__ == "__main__":
    main()
