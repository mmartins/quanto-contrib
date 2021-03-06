#!/usr/bin/python

# Script to parse the version of the logs that has powerstate
# changes as well. Output format is:
# <type> <subtype> <resource> time: <time> icount: <icount> arg:|ctx: <arg|ctx>

import sys
import re
import os

#Hack to insert the invocation dir first. This way we can use the
# local QuantAppConstants file if it exists
sys.path.insert(0,os.getcwd())

from LogUtil import *
from QuantoActivity import activity
from QuantoConstantNames import *
from QuantoCoreConstants import QuantoCoreConstants 
from QuantoGlobalPowerState import *

def usage():
    print >> sys.stderr, "Usage:", os.path.basename(sys.argv[0]) , "<raw log file>"
    print >> sys.stderr, "Two files will be produced:"
    print >> sys.stderr, "<raw log file>.parsed : the log made into human-readable form"
    print >> sys.stderr, "<raw log file>.pwr    : sum of time and energy spend on each powerstate"


if (len(sys.argv) != 2):
    usage()
    exit()

fname = sys.argv[1]
try:
    fin = open(fname, "r")
    fout = open(fname + '.parsed',"w")
    fpwr = open(fname + '.pwr',"w")
except IOError, e:
    print >> sys.stderr, "Error in file IO:", e
    if fin: fin.close()
    if fout: fout.close()
    if fpwr: fpwr.close()
    exit()


first = True
initialTime = 0
pState = GlobalPowerState()
lastStateKey = None;
cumTime = {}
cumIc = {}
cumChanges = {}
ic = 0

entries = entriesFromLFile(fin)

line = 0


for entry in entries:

    line = line + 1
    pState.updateFromEntry(entry)
    type = (entry.get_type() >> 4 ) & 0x0F
    subtype = entry.get_type() & 0x0F
    time = entry.get_time()
    time = 1000000/32768.0 * time  #convert to usec

    if (first and (
            type == QuantoLogConstants.MSG_TYPE_SINGLE_CHG or
            type == QuantoLogConstants.MSG_TYPE_MULTI_CHG or 
            type == QuantoLogConstants.MSG_TYPE_POWER_CHG 
        )):
        first = False
        initialTime = time;

    try:
      typeName = QuantoLogConstantsNamed.typeName[type]
    except KeyError, t:
      typeName = str(type)
      print >> sys.stderr, "Line: " + str(line) + " KeyError for msg type: " + str(t)
    try:
      subtypeName = QuantoLogConstantsNamed.subtypeName[type][subtype]
    except KeyError, t:
      subtypeName = str(subtype)
      print >> sys.stderr, "Line: " + str(line) + " KeyError for msg subtype: " + str(t)
    try:
      resourceName = QuantoAppConstants.resourceNames[entry.get_res_id()]
    except KeyError, t:
      resourceName = str(entry.get_res_id())
      print >> sys.stderr, "Line: " + str(line) + " KeyError for resource id: " + str(t)

    s =  typeName
    s += ' ' + subtypeName
    s += ' ' + resourceName
    if (type != QuantoLogConstants.MSG_TYPE_FLUSH_REPORT):
        time = time - initialTime
    s += ' time: ' + str(time)
    # Fix negative jump in time
    # Special case for interrupts from TIMERA1, which is the iCount
    # overflow interrupt. We must add 65536 to the value of iCount
    # on enter_interrupt for TIMERA1. We read the counter BEFORE the
    # interrupt routine, which is the routine that will correct the base.
    #if (entry.get_type() == QuantoLogConstants.SINGLE_CHG_ENTER_INT and
    #    (activity(entry.get_arg())).get_activity_type() == Msp430Constants.ACT_PXY_TIMERA1):
    #    ic += 65536
    last_ic = ic
    ic = entry.get_ic()
    if (last_ic - ic > 32768):
	ic += 65536
    s += ' icount: ' + str(ic)
    if (type == QuantoLogConstants.MSG_TYPE_SINGLE_CHG or
        type == QuantoLogConstants.MSG_TYPE_MULTI_CHG ):
        s += ' ctx: %s ' % activity(entry.get_arg())
    elif (type == QuantoLogConstants.MSG_TYPE_POWER_CHG):
        s += ' arg: 0x%0X ' % entry.get_arg()
    else:
        s += ' arg: ' + str(entry.get_arg())
    s += ' ps: ' + pState.getKey()
    print >> fout, s
    
    #Keep track of state time and energy for regression
    if (lastStateKey != None and lastStateKey != pState.getKey()):
        delta = time - lastStateTime
        cumTime[lastStateKey] = cumTime.get(lastStateKey, 0) + delta
        delta = ic - lastStateIc
        cumIc[lastStateKey] = cumIc.get(lastStateKey, 0) + delta
        cumChanges[lastStateKey] = cumChanges.get(lastStateKey, 0) + 1

    lastStateKey = pState.__str__()
    lastStateTime = time
    lastStateIc = ic

    #end of stdin loop
fin.close()
fout.close()

print >>fpwr, '#state          time      icount    occurrences'
print >>fpwr, '#states:',pState.getHeader()
print >>fpwr, '#=============================================='
for key in sorted(cumTime.keys(), key=lambda x:cumIc[x], reverse=True):
    print >>fpwr, key ,  cumTime[key]  , cumIc[key], cumChanges[key]

fpwr.close()


