#!/usr/bin/env ruby

def mymatch(rgx,str); !!(rgx=~str) end

p mymatch(/[Gg].t/,"Github!")
